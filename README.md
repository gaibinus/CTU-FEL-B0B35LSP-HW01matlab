## Použitie
1. otvor directory v Matlabe (nemalo by záležať na verzii)
2. otvor skript *formulaFinder.m* (zvyšok sú volané funkcie)
3. zmeň kód morzeovky za svoj, zachovaj apostrofy na krajoch
4. uži si ušetrený čas nad Karnaughovými mapami :heart:

## Poznámky:
- Directory obsahuje 1 skript a 2 funkcie z ktorých jedna nie je moja ale z [Matlab File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/37118-mintruthtable-tt-flags)
- Vstupom je binárny kód morzeovky, jeho dĺžka sa zisťuje a zaokrúhľuje na 2. mocninu automaticky
- Skript samostatne vygeneruje stop-bit vektor, jeho formula sa generuje rovnako ako tá morzeovky
- Morzeovka sa doplní na 2. mocninu a minimalizuje DNC s využitím Quine-McCluskey algoritmu
- Formule sa hľadajú spomenutým algoritmom ako **SOP** (Gollovej **DNF** Disjunktivní normální forma)
- Výstupom sú dve formule a) morzeovka b) stop-bit so Šusta-friendly notáciou (ako v prezentácii)

## Pre matlab nováčikov:
![matlab help](https://github.com/gaibinus/CTU-FEL-B0B35LSP-HW01matlab/blob/master/matlabHowTo.png)
