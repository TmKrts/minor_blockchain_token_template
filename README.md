# Minor blockchain token template

Dit is de codebase om een token te deployen op een testnet. Deze github bestaat uit het volgende:

- Contract:
  - Token.sol die een token maakt vanuit de ERC20 standaard met een naam en afkorting.
- Scripts:
  - 1_deploy_token.py: hierin wordt de "initial supply" van de token gezet en wordt het token gedeployed.
  - helpful_scripts.py: hierin wordt na gerefereeerd vanuit het "1_deploy_token_script.py" bestand om het juiste account op te halen op basis van hoe de gebruiker wil deployen. Bijvoorbeeld lokaal ganache account of testnet account.
- brownie-config.yaml: hierin worden externe packages vermeld zodat iedereen gebruikt maakt van dezelfde packages en versies. Daarnaast wordt ook verwezen naar een file met persoonlijke gegeven. Hierover verderop meer.

## Vereisten:

Om deze code zelf te runnen moet je het volgende gedownload hebben:

- MetaMask browser extension met een account. Om zeker te zijn dat je niet perongeluk met echte ether gaat werken is een test account aan te raden.
- Een code editor (bijvoorbeeld: Visual studio code: https://code.visualstudio.com/download).
  - Optioneel: Solidity extension in Visual Studio Code.
    - Zoek "juanblanco.solidity" op in de visual studio market place in visual studio code.
- Git om deze repository the clonen: https://git-scm.com/downloads.
- NodeJs: https://nodejs.org/en/download/
  - Dit is nodig om met NPM (een package manager) ganache te installeren.
- Ganache-cli: [Installeren ganache-cli](#ganache-cli-installeren)
  - Om een lokale blockchain te runnen.
  - Brownie (het framework voor het deployen van smart contracts) is hiervan afhankelijk.
- Python (release 3.9.7): https://www.python.org/downloads/release/python-397/
  - Omdat dit een paar specifieke versie stappen vereist kun je ook deze tutorial volgen om zeker te weten dat het goed gaat: [Installeren python](#installeren-python).
  - Dit is nodig om WEB3 scripts te runnen.
  - Met python moet je ook de volgende packages installeren om brownie te laten werken:
    - pipx: [Installeren pipx](#pipx)
    - Cython [Installeren Cython](#Cython-&-cytoolz)
    - cytoolz [Installeren cytoolz](#Cython-&-cytoolz)
- C++ build tools: [Installeren C++ build tools](#C++-Build-tools)

## Hoe deze repository te clonen en eigen token te deployen? (Ropsten testnet) (Voor windows gebruikers)

### Clonen

Clone deze repository in een folder naar keuze. Dit kan je doen door gebruik te maken van git. Maak een folder aan waarin je de code wilt hebben en open in die folder een terminal. Kun je doen door in de file explorer shift + rechtermuisknop en de folder te openen in PowerShell.

Run in die shell het volgende commando:

```
git clone https://github.com/TmKrts/minor_blockchain_token_template.git
```

Open vervolgens de code editor op die folder.

### Ganache-cli installeren

Als het goed is heb je NodeJs geïnstalleerd en daarmee ook automatisch NPM het bijbehoorden package manager. Dit kan je controleren door in een terminal de volgende commando's te runnen:

```
node --version
```

```
npm --version
```

Wanneer beide een versie terug geven en geen error betekent dat het goed geïnstalleerd is.

Om ganache globaal te installeren (wat betekend dat je het vanaf overal kan runnen) run het volgende commando:

```
npm install -g ganache-cli
```

Windows maakt dan automatisch een .ps1 file aan waardoor het commando wat je wilt runnen niet werkt. Dit bestand moet verwijderd worden.

![ganache-cli ps1 bestand](https://github.com/TmKrts/minor_blockchain_token_template/blob/main/assets/ps1File.png)

Zoek dit bestand op op uw computer en verwijder het.

Om te controleren of ganache goed is geïnstalleerd run het volgende commando in een terminal:

```
ganache-cli
```

Als er vervolgens een lokale ganache server wordt gedraaid betekend het dat het goed geïnstalleerd is.

### C++ Build tools

Brownie is afhankelijk van een paar van deze packages. Welke dat zijn wordt uitgelegd in dit hoofdstuk.

Download de build tools van de volgende site: https://visualstudio.microsoft.com/visual-cpp-build-tools/

Run dat programma vervolgens en installeer de Desktop development with C++ workload. Zie afbeelding hierinder:

![c++ workload](https://github.com/TmKrts/minor_blockchain_token_template/blob/main/assets/build-tools.png)

Mocht dit tijdens de installatie fout gegaan zijn is het nog altijd aanpasbaar door het gedownloade bestand opnieuw te runnen.

### Python

#### Installeren Python

Scroll in de volgende link naar beneden en kies uit de tabel de juiste windows installer: https://www.python.org/downloads/release/python-397/. Zorg er bij de installatie voor dat je pip ook installeert en zorgt dat python toegevoegd word als envornment variable. Zie volgende foto's:

![python pip bestand](https://github.com/TmKrts/minor_blockchain_token_template/blob/main/assets/python-pip.png)
![python environment bestand](https://github.com/TmKrts/minor_blockchain_token_template/blob/main/assets/python-environment.png)

Om te controleren of python goed is geïnstaleerd run het volgende commando in die terminal:

```
python
```

Als python goed is geïnstalleerd zou de terminal moeten veranderen. Run het volgende commando om hier weer uit te gaan:

```
exit()
```

#### Pip

Pip zou als het goed is geïnstalleerd moeten zijn met python.

Om te controlleren of pip ook goed in geïnstalleerd run:

```
pip --version
```

Mocht dit niet het geval zijn run dan de installer opnieuw en pas de installatie aan. Zie volgende afbeelding:

![python pip bestand](https://github.com/TmKrts/minor_blockchain_token_template/blob/main/assets/python-setup-modify.png)

#### pipx

Het wordt aangeraden om brownie te installeren met pipx. Hiervoor moet pipx nog geïnstalleerd worden. Dit kun je doen daar in een terminal de volgende commando's te runnen:

```
python -m pip install --user pipx
```

```
python -m pipx ensurepath
```

Om er zeker van te zijn dat pipx goed werkt als systeem variabelen wordt aangeraden het systeem opnieuw op te starten.

Om te controlleren of pipx goed is geïnstalleerd run het volgende commando in een terminal:

```
pipx --version
```

#### Cython & cytoolz

Om brownie te kunnen installeren heb je Cython en cytoolz nodig. Dit kun je doen door het runnen van de volgende commando's:

```
pip install Cython
```

```
pip install cytoolz
```

### Brownie installeren

Het is aan te raden om brownie te installeren op pip als pipx. Dit is te doen als aan alle eisen is voldaan met de volgende commando's:

```
pip install eth-brownie
```

```
pipx install eth-brownie
```

### Deployen op lokaal testnetwerk

Verander in het "token.sol" de tekst tussen "" naar een naam (lijn 7) en afkorting (lijn 8).

Open een terminal en run:

```
brownie compile
```

Dit zorgt dat alle nodige dependencies gedownload kunnen worden en dat de code kan compilen.

Om vervolgens te een token te deployen op een lokale ganache server run:

```
brownie run ./scripts/1_deploy_token
```

### Deployen op ropsten testnet

Maak een account aan op https://infura.io/. Gevolgd door met een ethereum project. Dit moet je namelijk hebben om te kunnen connecten met het ethereum netwerk.

Maak in de hoofdfolder van de code editor een bestand aan met de naam: ".env". Zet hier vervolgens je private key in van ROPSTEN testnetwerk in je metamask (https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
Dat ziet er dan als volgt uit:

```
export ROPSTEN_PRIVATE_KEY=<YOUR ROPSTEN PRIVATE KEY>
```

Met uw persoonlijk prive sleutel tussen de <>. Gevolgd met een lijn die linkt naar het infura project. In de settings van dat project kun je het "PROJECT ID" kopiëren. Zet de volgende lijn in de .env file:

```
export WEB3_INFURA_PROJECT_ID=<YOUR INFURA PROJECT ID>
```

Met uw infura project id tussen de <>.

Verander in het "token.sol" bestand de tekst tussen "" naar een naam (lijn 7) en afkorting (lijn 8).

Open een terminal en run:

```
brownie compile
```

Dit zorgt dat alle nodige dependencies gedownload kunnen worden en dat de code kan compilen.

Vevolgens is het token deployable op het ropsten testnet met het volgende commando:

```solidity
brownie run scripts/1_deploy_token.py --network ropsten
```
