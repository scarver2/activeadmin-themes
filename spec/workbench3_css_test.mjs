// spec/workbench3_css_test.mjs
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import postcss from "postcss";

const root = new URL("../lib/active_admin/themes/recipes/workbench_3/", import.meta.url);
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

test("Workbench 3.x concerns form valid PostCSS in explicit manifest order", () => {
  const result = postcss().process(source, { from: undefined });
  const selectors = [];
  result.root.walkRules((rule) => selectors.push(rule.selector));

  assert.deepEqual(result.warnings(), []);
  assert.match(selectors[0], /data-activeadmin-theme="workbench-3"/);
  assert.ok(selectors.includes('body[data-activeadmin-theme="workbench-3"] .workbench-3-workspace'));
  assert.ok(selectors.some((selector) => selector.includes(".workbench-3-data-table")));
  assert.ok(selectors.some((selector) => selector.includes(".workbench-3-primary-action")));
});

test("Workbench 3.x source keeps every selector scoped to its theme or preference context", () => {
  const tree = postcss.parse(source);

  tree.walkRules((rule) => {
    assert.match(rule.selector, /body\[data-activeadmin-theme="workbench-3"\]/);
  });
});

test("Workbench 3.x does not mutate earlier heritage recipe bytes", () => {
  const workbench2 = new URL("../lib/active_admin/themes/recipes/workbench_2/", import.meta.url);
  const workbench2Source = parts.map((part) => readFileSync(new URL(`${part}.css`, workbench2), "utf8")).join("\n");

  assert.doesNotMatch(workbench2Source, /workbench-3/);
  assert.doesNotMatch(source, /workbench-2/);
});
