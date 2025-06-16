#!/usr/bin/env python3
import os
import re
import json


def main():
    translations_dir = os.path.dirname(os.path.realpath(__file__))

    for filename in os.listdir(translations_dir):
        if not filename.endswith('.dart'):
            continue
        locale = filename[:-5]
        lang = locale.split('_')[0]
        dart_path = os.path.join(translations_dir, filename)
        with open(dart_path, 'r', encoding='utf-8') as f:
            content = f.read()
        # Estrae il corpo della mappa
        m = re.search(r"Map<String, String>\s+\w+\s*=\s*\{([\s\S]*?)\}", content)
        if not m:
            print(f"Skip {filename}: no map literal found")
            continue
        body = m.group(1)
        pairs = re.findall(r"['\"]([^'\"]+)['\"]\s*:\s*['\"]([^'\"]*)['\"]", body)
        data = {'@@locale': lang}
        for k, v in pairs:
            data[k] = v.replace('\\n', '\n')
        arb_name = f"intl_{lang}.arb"
        arb_path = os.path.join(translations_dir, arb_name)
        with open(arb_path, 'w', encoding='utf-8') as out:
            json.dump(data, out, ensure_ascii=False, indent=2)
        print(f"Written {arb_path}")

    print('Conversione completata.')

if __name__ == '__main__':
    main()
