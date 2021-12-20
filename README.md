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
  - Dit is nodig om met NPM (een package manager) ganache te installeren. (Omdat hier iets meer handelingen voor nodig zijn zie: [Installeren ganache-cli](#ganache-cli-installeren))
- Python: https://www.python.org/downloads/
  - Dit is nodig om WEB3 scripts te runnen

## Hoe deze repository te clonen en eigen token te deployen? (Ropsten testnet) (Voor windows gebruikers)

### Clonen

Clone deze repository in een folder naar keuze. Dit kan je doen door gebruik te maken van git. Maak een folder aan waarin je de code wilt hebben en open in die folder een terminal. Kun je doen door in de file explorer shift + rechtermuisknop en de folder te openen in PowerShell.

Run in die shell het volgende commando:

```
git clone https://github.com/TmKrts/minor_blockchain_token_template.git
```

Open vervolgens de code editor op die folder.

In de explorer. Druk op rechtermuisknop en klik op: open integrated terminal wat een geïtegreerde terminal zou moeten openen.

Om te controleren of python goed is geïnstaleerd run het volgende commando in die terminal:

```
py
```

Als python goed is geïnstalleerd zou de terminal moeten veranderen. Run het volgende commando om hier weer uit te gaan:

```
exit()
```

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

![ganache-cli ps1 bestand]("./assets/2021-12-20 09_41_39-ganache-cli - npm.png")

Zoek dit bestand op op uw computer en verwijder het.

Om te controleren of ganache goed is geïnstalleerd run het volgende commando in een terminal:

```
ganache-cli
```

Als er vervolgens een lokale ganache server wordt gedraaid betekend het dat het goed geïnstalleerd is.

### Brownie installeren

Als het goed is heb je python niet geïnstaleerd via de microsoft store dus zullen de commands in de volgende link niet werken: https://eth-brownie.readthedocs.io/en/stable/install.html. In plaats van python moet het py zijn. Dus gebruik de volgende commands om pipx te installeren:

```
py -m pip install --user pipx
```

```
py -m pipx ensurepath
```

Als python via de microsoft store is geïnstalleerd zet ensurepath het foute path waardoor pipx niet gevonden kan worden.

Wanneer de hierboven staande command gerunt zijn, herstart de computer zodat de Path variablen goed werken. Wanneer je vervolgens de code editor weer opent met een integrated terminal zou het volgende commando moeten werken:

```
pipx
```

Installeer vervolgens brownie met het volgende commando:

```
pipx install eth-brownie
```

Mocht dit niet werken installeer dan ook python in de microsoft store en run het commando opnieuw.
Mochten de visual studio build tools ontbreken. Installeer die dan ook door op het linkje in de terminal te klikken.

// TODO find out why brownie install isn't working

Maak in de hoofdfolder een bestand aan met de naam: ".env". Zet hier vervolgens je private key in van ROPSTEN testnetwerk in je metamask (https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
Dat ziet er dan als volgt uit:

```
export ROPSTEN_PRIVATE_KEY=<YOUR ROPSTEN PRIVATE KEY>
```

Met jouw persoonlijk prive sleutel tussen de <>.

Verander in het "token.sol" de tekst tussen "" naar een naam (lijn 7) en afkorting (lijn 8).

Open een terminal en run:

```
brownie compile
```

Dit zorgt dat alle nodige dependencies gedownload kunnen worden en dat de code kan compilen.

Wanneer het compilen successvol is gelukt zou het token contract deployable moeten zijn. Om te voorkomen dat het misschien fout gaat is het script ook eerst lokaal te runnen. In dat geval zal brownie de ganache-cli op spinnen. Het is dan niet mogelijk om met het contract te werken, want dat zou dan vooraf geprogrameerd moeten worden, maar dan is in ieder geval duidleijk dat het contract lokaal te deployen is.

Dit is te doen met het volgende commando:

```solidity
brownie run scripts/1_deploy_token.py
```

Als alles daar werkt en u bent tevreden met uw token kunt u het deployen naar het ropsten testnet door middel van het commando:

```solidity
brownie run scripts/1_deploy_token.py --network ropsten
```
