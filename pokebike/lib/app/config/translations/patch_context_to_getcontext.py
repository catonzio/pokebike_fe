#!/usr/bin/env python3
import os
import re

# Script per sostituire context. con Get.context! e garantire import di Get
script_dir = os.path.dirname(os.path.realpath(__file__))
# root del progetto, 4 livelli su
project_root = os.path.abspath(os.path.join(script_dir, os.pardir, os.pardir, os.pardir, os.pardir))

for root, _, files in os.walk(os.path.join(project_root, 'lib')):
    norm_root = os.path.normpath(root)
    trans_path = os.path.normpath(os.path.join(project_root, 'lib', 'app', 'config', 'translations'))
    # Rimuovi import di Get nei file di traduzioni
    if norm_root.startswith(trans_path):
        for filename in files:
            if filename.endswith('.dart'):
                file_path = os.path.join(root, filename)
                with open(file_path, 'r', encoding='utf-8') as f:
                    lines = f.readlines()
                new_lines = [l for l in lines if "import 'package:get/get.dart'" not in l]
                if len(new_lines) != len(lines):
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.writelines(new_lines)
                    print(f"Removed import from {file_path}")
        continue
    for filename in files:
        if not filename.endswith('.dart'):
            continue
        # Rimuovi import di Get nei file generati (.g.dart, .freezed.dart)
        if filename.endswith('.g.dart') or filename.endswith('.freezed.dart'):
            file_path = os.path.join(root, filename)
            with open(file_path, 'r', encoding='utf-8') as f:
                lines = f.readlines()
            new_lines = [l for l in lines if "import 'package:get/get.dart'" not in l]
            if len(new_lines) != len(lines):
                with open(file_path, 'w', encoding='utf-8') as f:
                    f.writelines(new_lines)
                print(f"Removed import from {file_path}")
            continue
        file_path = os.path.join(root, filename)
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        # process only files containing context usage
        if 'context.' not in content:
            continue
        modified = False
        # sostituisci context. con Get.context!.
        new_content = re.sub(r"\bcontext\.", "Get.context!.", content)
        if new_content != content:
            content = new_content
            modified = True
        if modified:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f'Updated: {file_path}')
print('Patch context completata.')
