# with-praxis — Public Product

**Part of the Empire:** PX (`~/personal/praxis/`) • Keeper (`~/personal/keeper/`) • 16e (`~/projects/s16e/`)

---

## What This Is

Public, productized version of Praxis. Sanitized skills, commands, and documentation for external users.

**Workflow:**
1. Develop features in PX (`~/personal/praxis/`)
2. Test with `/deploy`
3. Publish to product: `/px:publish-to-product`

---

## Structure

```
with-praxis/
├── commands/        # Productized commands
├── skills/          # Productized skills
├── system/          # Identity, knowledge-map
├── docs/            # User documentation
├── tools/           # Telemetry tool
├── website/         # Product website
└── install.sh       # User installation script
```

---

## Key Difference from PX

| Aspect | PX (private) | with-praxis (public) |
|--------|--------------|----------------------|
| Sebastian-specific | ✅ | ❌ Removed |
| Personal context | ✅ | ❌ Removed |
| Full telemetry | ✅ | ✅ Included |
| Experimental | ✅ | ❌ Stable only |

---

**Remember:** This is the PUBLIC face of Praxis. No personal details, no experimental features, no Sebastian-specific content.
