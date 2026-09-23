// spec/mercury_flight_css_test.mjs
// spec/mercury_flight_css_test.mjs
import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import test from "node:test";

import postcss from "postcss";

const root = new URL("../lib/active_admin/themes/recipes/mercury_flight/", import.meta.url);
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

test("Mercury Flight concerns form valid PostCSS in explicit manifest order", () => {
  const result = postcss().process(source, { from: undefined });
  const selectors = [];
  result.root.walkRules((rule) => selectors.push(rule.selector));

  assert.deepEqual(result.warnings(), []);
  assert.match(selectors[0], /data-activeadmin-theme="mercury_flight"/);
  assert.ok(selectors.includes('body[data-activeadmin-theme="mercury_flight"] .mercury-flight-workspace'));
  assert.ok(selectors.some((selector) => selector.includes(".mercury-flight-data-table")));
  assert.ok(selectors.some((selector) => selector.includes(".mercury-flight-primary-action")));
});

test("Mercury Flight keeps every selector scoped to its theme", () => {
  postcss.parse(source).walkRules((rule) => {
    assert.match(rule.selector, /body\[data-activeadmin-theme="mercury_flight"\]/);
  });
});

test("Mercury Flight uses only its complete custom-property namespace", () => {
  postcss.parse(source).walkDecls((declaration) => {
    if (declaration.prop.startsWith("--mercury")) {
      assert.match(declaration.prop, /^--mercury-flight-/);
    }

    for (const match of declaration.value.matchAll(/var\((--mercury[^,)]+)/g)) {
      assert.match(match[1], /^--mercury-flight-/);
    }
  });
});

test("Mercury Flight foreground and concrete surface pairs meet WCAG AA", () => {
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

  assert.ok(contrast("#2f3033", "#fffdf9") >= 4.5);
  assert.ok(contrast("#2f3033", "#f5eee7") >= 4.5);
  assert.ok(contrast("#665f5a", "#fffdf9") >= 4.5);
  assert.ok(contrast("#ffffff", "#a73829") >= 4.5);
  assert.ok(contrast("#ffffff", "#b94535") >= 4.5);
  assert.ok(contrast("#fffaf2", "#29292b") >= 4.5);
});

test("Mercury Flight does not mutate the accepted Video Toaster recipe bytes", () => {
  const toaster = new URL("../lib/active_admin/themes/recipes/video_toaster_4000/", import.meta.url);
  const toasterSource = parts.map((part) => readFileSync(new URL(`${part}.css`, toaster), "utf8")).join("\n");
  const digest = createHash("sha256").update(toasterSource).digest("hex");

  assert.equal(digest, "a5296593724aea2d14ad5dfaf2d48b07df573398e930936c49cd48abbcffb2e8");
  assert.doesNotMatch(toasterSource, /body\[data-activeadmin-theme="mercury_flight"\]/);
});
