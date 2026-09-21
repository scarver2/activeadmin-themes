// spec/mui_css_test.mjs
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

import postcss from "postcss";

const root = new URL("../lib/active_admin/themes/recipes/mui/", import.meta.url);
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

test("MUI concerns form valid PostCSS in explicit manifest order", () => {
  const result = postcss().process(source, { from: undefined });
  const selectors = [];
  result.root.walkRules((rule) => selectors.push(rule.selector));

  assert.deepEqual(result.warnings(), []);
  assert.match(selectors[0], /data-activeadmin-theme="mui"/);
  assert.ok(selectors.includes('body[data-activeadmin-theme="mui"] .mui-workspace'));
  assert.ok(selectors.some((selector) => selector.includes(".mui-data-table")));
  assert.ok(selectors.some((selector) => selector.includes(".mui-primary-action")));
});

test("MUI source keeps every selector scoped to its theme or preference context", () => {
  const tree = postcss.parse(source);

  tree.walkRules((rule) => {
    assert.match(rule.selector, /body\[data-activeadmin-theme="mui"\]/);
  });
});

test("MUI does not mutate earlier heritage recipe bytes", () => {
  const workbench3 = new URL("../lib/active_admin/themes/recipes/workbench_3/", import.meta.url);
  const workbench3Source = parts.map((part) => readFileSync(new URL(`${part}.css`, workbench3), "utf8")).join("\n");

  assert.doesNotMatch(workbench3Source, /data-activeadmin-theme="mui"/);
  assert.doesNotMatch(source, /workbench-3/);
});
