// spec/amigaos4_css_test.mjs
import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import test from "node:test";

import postcss from "postcss";

const root = new URL("../lib/active_admin/themes/recipes/amigaos_4/", import.meta.url);
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

test("AmigaOS 4 concerns form valid PostCSS in explicit manifest order", () => {
  const result = postcss().process(source, { from: undefined });
  const selectors = [];
  result.root.walkRules((rule) => selectors.push(rule.selector));

  assert.deepEqual(result.warnings(), []);
  assert.match(selectors[0], /data-activeadmin-theme="amigaos_4"/);
  assert.ok(selectors.includes('body[data-activeadmin-theme="amigaos_4"] .amigaos-4-workspace'));
  assert.ok(selectors.some((selector) => selector.includes(".amigaos-4-data-table")));
  assert.ok(selectors.some((selector) => selector.includes(".amigaos-4-primary-action")));
});

test("AmigaOS 4 source keeps every selector scoped to its theme or preference context", () => {
  const tree = postcss.parse(source);

  tree.walkRules((rule) => {
    assert.match(rule.selector, /body\[data-activeadmin-theme="amigaos_4"\]/);
  });
});

test("AmigaOS 4 does not mutate the accepted MUI recipe bytes", () => {
  const mui = new URL("../lib/active_admin/themes/recipes/mui/", import.meta.url);
  const muiSource = parts.map((part) => readFileSync(new URL(`${part}.css`, mui), "utf8")).join("\n");
  const digest = createHash("sha256").update(muiSource).digest("hex");

  assert.equal(digest, "8d98d75364189a68c1383932a2b3eebf05443c48ff147ec7656272a363072f8c");
  assert.doesNotMatch(source, /body\[data-activeadmin-theme="mui"\]/);
});
