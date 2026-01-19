# Projekt 2 – Šifra modulovaná podľa spoluhlások

Tento repozitár obsahuje školský projekt zameraný na implementáciu souhláskově modulované samohláskové šifry v jazyku MIPS64 pomocí simulátoru EduMIPS64.

Projekt bol vytvorený v rámci univerzitného zadania na FIT VUT a slúži výlučne na vzdelávacie účely.

## Obsah projektu
- **xlogin00.s** – program realizujúci šifru v MIPS64
- **hello.s** – vzorový súbor na testovanie simulátora
- **README.md** – dokumentácia projektu

## Pokyny
- Zpráva obsahuje len malé písmená `a-z`, bez medzier a diakritiky.
- Šifrujú sa iba samohlásky (`a, e, i, o, u, y`) podľa predchádzajúcej súhlásky.
- Max. dĺžka správy: 30 znakov (`cipher:`).
- Výpis výsledného textu realizovaný syscall `print_string` ukončený hodnotou 0.

## Hodnotenie
Missing name, surname, or login. | Simulator output mismatch for input 'user name': printed='zndrwjbluznok', expected='andrwjbluznok' (-10b)
(Plne funkčné, stačí zabrániť prepísaniu počiatočných samohlások na spoluhlásky)
