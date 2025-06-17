#!/usr/bin/env python3
import os
import re

# Script per aggiungere import di S ed effettuare replacement di .tr
script_dir = os.path.dirname(os.path.realpath(__file__))
# Calcola la root del progetto (4 livelli su da translations)
project_root = os.path.abspath(os.path.join(script_dir, os.pardir, os.pardir, os.pardir, os.pardir))

for root, _, files in os.walk(os.path.join(project_root, 'lib')):
    for filename in files:
        if not filename.endswith('.dart'):
            continue
        file_path = os.path.join(root, filename)
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        if "'.tr" not in content:
            continue
        lines = content.split('\n')
        # Aggiungi import se mancante
        import_stmt = "import 'package:moto_hunters/generated/l10n.dart';"
        if import_stmt not in content:
            # trova ultimo import
            last_imp = 0
            for i, line in enumerate(lines):
                if line.strip().startswith('import '):
                    last_imp = i
            lines.insert(last_imp+1, import_stmt)
        content = '\n'.join(lines)
        # Sostituisci 'key'.tr con S.of(context).key
        new_content = re.sub(r"['\"]([^'\"]+)['\"]\.tr", r"S.of(context).\1", content)
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated: {file_path}")

print('Patch completata.')
