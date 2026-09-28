// spec/aros_zune_css_test.mjs
import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import test from "node:test";

import postcss from "postcss";

const root = new URL("../lib/active_admin/themes/recipes/aros_zune/", import.meta.url);
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

test("AROS/Zune concerns form valid PostCSS in explicit manifest order", () => {
  const result = postcss().process(source, { from: undefined });
  const selectors = [];
  result.root.walkRules((rule) => selectors.push(rule.selector));

  assert.deepEqual(result.warnings(), []);
  assert.match(selectors[0], /data-activeadmin-theme="aros_zune"/);
  assert.ok(selectors.includes('body[data-activeadmin-theme="aros_zune"] .aros-zune-workspace'));
  assert.ok(selectors.some((selector) => selector.includes(".aros-zune-data-table")));
  assert.ok(selectors.some((selector) => selector.includes(".aros-zune-primary-action")));
});

test("AROS/Zune source keeps every selector scoped to its theme or preference context", () => {
  const tree = postcss.parse(source);

  tree.walkRules((rule) => {
    assert.match(rule.selector, /body\[data-activeadmin-theme="aros_zune"\]/);
  });
});

test("AROS/Zune does not mutate the accepted AmigaOS 4 recipe bytes", () => {
  const amigaos4 = new URL("../lib/active_admin/themes/recipes/amigaos_4/", import.meta.url);
  const amigaos4Source = parts.map((part) => readFileSync(new URL(`${part}.css`, amigaos4), "utf8")).join("\n");
  const digest = createHash("sha256").update(amigaos4Source).digest("hex");

  assert.equal(digest, "a035b1fe024392fb09af4324a43c886e0379aeb3042486b764e475613028f2ce");
  assert.doesNotMatch(source, /body\[data-activeadmin-theme="amigaos_4"\]/);
});
