// spec/video_toaster_4000_css_test.mjs
import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import test from "node:test";

import postcss from "postcss";

const root = new URL("../lib/active_admin/themes/recipes/video_toaster_4000/", import.meta.url);
const parts = [
  "foundation/tokens",
  "foundation/base",
  "components/navigation",
  "components/launchers",
  "components/windows",
  "components/data",
  "components/forms",
  "surfaces/workspace",
  "hardening/responsive",
  "hardening/preferences",
];
const source = parts.map((part) => readFileSync(new URL(`${part}.css`, root), "utf8")).join("\n");

test("Video Toaster 4000 concerns form valid PostCSS in explicit manifest order", () => {
  const result = postcss().process(source, { from: undefined });
  const selectors = [];
  result.root.walkRules((rule) => selectors.push(rule.selector));

  assert.deepEqual(result.warnings(), []);
  assert.match(selectors[0], /data-activeadmin-theme="video_toaster_4000"/);
  assert.ok(selectors.includes('body[data-activeadmin-theme="video_toaster_4000"] .video-toaster-4000-workspace'));
  assert.ok(selectors.some((selector) => selector.includes(".video-toaster-4000-data-table")));
  assert.ok(selectors.some((selector) => selector.includes(".video-toaster-4000-primary-action")));
});

test("Video Toaster 4000 keeps every selector scoped to its theme or preference context", () => {
  const tree = postcss.parse(source);

  tree.walkRules((rule) => {
    assert.match(rule.selector, /body\[data-activeadmin-theme="video_toaster_4000"\]/);
  });
});

test("Video Toaster 4000 uses only its complete versioned custom-property namespace", () => {
  const declarations = [];
  postcss.parse(source).walkDecls((declaration) => declarations.push(declaration));

  for (const declaration of declarations) {
    if (declaration.prop.startsWith("--video-toaster")) {
      assert.match(declaration.prop, /^--video-toaster-4000-/);
    }

    for (const match of declaration.value.matchAll(/var\((--video-toaster[^,)]+)/g)) {
      assert.match(match[1], /^--video-toaster-4000-/);
    }
  }
});

test("Video Toaster 4000 foreground and concrete surface pairs meet WCAG AA", () => {
  const channel = (value) => {
    const normalized = value / 255;
    return normalized <= 0.04045 ? normalized / 12.92 : ((normalized + 0.055) / 1.055) ** 2.4;
  };
  const luminance = (hex) => {
    const channels = hex.match(/[0-9a-f]{2}/gi).map((value) => channel(Number.parseInt(value, 16)));
    return (0.2126 * channels[0]) + (0.7152 * channels[1]) + (0.0722 * channels[2]);
  };
  const contrast = (foreground, background) => {
    const values = [luminance(foreground), luminance(background)].sort((a, b) => b - a);
    return (values[0] + 0.05) / (values[1] + 0.05);
  };

  assert.ok(contrast("#f0f0f0", "#656565") >= 4.5);
  assert.ok(contrast("#f0f0f0", "#555555") >= 4.5);
  assert.ok(contrast("#f0f0f0", "#313131") >= 4.5);
  assert.ok(contrast("#111111", "#9a9a9a") >= 4.5);
  assert.ok(contrast("#111111", "#ffef75") >= 4.5);
  assert.ok(contrast("#111111", "#ceba75") >= 4.5);
});

test("Video Toaster 4000 does not mutate the accepted Haiku beta6 recipe bytes", () => {
  const haiku = new URL("../lib/active_admin/themes/recipes/haiku_beta6/", import.meta.url);
  const haikuSource = parts.map((part) => readFileSync(new URL(`${part}.css`, haiku), "utf8")).join("\n");
  const digest = createHash("sha256").update(haikuSource).digest("hex");

  assert.equal(digest, "e806b01f5930d837b2d47d25698519361d9ebd544e68edecab8e95d1cec03dc2");
  assert.doesNotMatch(haikuSource, /body\[data-activeadmin-theme="video_toaster_4000"\]/);
});
