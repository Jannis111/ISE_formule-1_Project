<div style="color:#d91e57; font-size: 50px; font-weight: bold;">DoD</div>

## Eisen documentatie
- [ ] Voldoet aan AIM controle kaart (zie Plan van aanpak hoofdstuk 6).
- [ ] Is minimaal door een andere groepsgenoot doorgelezen en goedgekeurd.
- [ ] Het bevat alle hoofdstukken en onderdelen die horen bij het soort document (Zie Plan van aanpak hoofdstuk 6 'testrapport', 'onderzoeksverslagen', of 'opleverdocument').
- [ ] Naamgevingen binnen documenten zijn consistent met elkaar.
- [ ] Geen spellingsfouten.
- [ ] Traceerbaarheid tussen de documentaties.
- [ ] Naamgeving consistentie.

## Functioneel ontwerp
### Usecase diagrams
- [ ] Heeft een of meerdere usecase(s).
- [ ] Heeft een of meerdere actor(s).

### Fullydressed usecases
- [ ] Heeft een primary actor.
- [ ] Heeft een of meerdere Stakeholder(s) met een Interest.
- [ ] Bevat een brief description van de fullydressed usecase.
- [ ] Bevat een of meerdere precondition(s).
- [ ] Bevat een of meerdere postcondition(s).
- [ ] Bevat een main success scenario.
- [ ] Een scenario bestaat uit een actor action en systeem action.
- [ ] Bevat minimaal één alternative flow.
- [ ] Het main succes scenario eindigt met een systeem actie.

### Zinnen maken/opstellen
- [ ] Zin klopt syntactisch.
- [ ] Een zin moet in de nederlandse taal geschreven zijn.
- [ ] Een zin moet elementair zijn.
- [ ] Een zin moet uit twee segmenten bestaan.
- [ ] Van een feittype moeten er minimaal 2 voorbeeld zinnen gemaakt zijn.

### Zinnen analyseren
- [ ] Een zin moet uit twee segmenten bestaan.
- [ ] De geanalyseerd zin klopt syntactisch.
- [ ] De zinnen worden op aantal segmenten gesorteerd van laag naar hoog.
- [ ] Een Entiteit dat vaker dan een keer voorkomt word na de eerste keer met "MATCH" beschreven.
- [ ] Bij elke zin word aan het eind van de analyse een predicaat gemaakt.
- [ ] Wanneer een zin twee entiteiten bevat moet dat een relatie vormen.

### CDM
- [ ] Het CDM is traceerbaar van een geanalyseerd zin.
- [ ] Het CDM klopt syntactisch.

### Business rules
- [ ] De business rules kloppen syntactisch.

### Matrix met rollen en rechten
- [ ] Een onderbouwing per rol waarom zij die rechten hebben.

## Technisch ontwerp
- [ ] Het technisch ontwerp is compleet en bevat alle noodzakelijke secties.
- [ ] Het document is beoordeeld en goedgekeurd door minstens één teamlid.
- [ ] Alle onderdelen zijn aan een expert voorgelegd.

### Architectuur ontwerp
- [ ] Het architectuurontwerp is duidelijk gedefinieerd en gedocumenteerd.
- [ ] Het architectuurontwerp is beoordeeld en goedgekeurd door minstens één teamlid.

### PDM
- [ ] Het fysieke datamodel (PDM) is compleet en nauwkeurig.
- [ ] Het PDM is beoordeeld en goedgekeurd door minstens één teamlid.

### Integriteitsregels
- [ ] Alle integriteitsregels zijn gedefinieerd en gedocumenteerd.
- [ ] De integriteitsregels zijn beoordeeld en goedgekeurd door minstens één teamlid.

### Matrix met grants en revokes
- [ ] De matrix met grants en revokes is compleet en nauwkeurig.
- [ ] De matrix is beoordeeld en goedgekeurd door minstens één teamlid.

### Datatypens/domeinen
- [ ] Alle datatypen en domeinen zijn gedefinieerd en gedocumenteerd.
- [ ] De datatypen en domeinen zijn beoordeeld en goedgekeurd door minstens één teamlid.

### Indexen
- [ ] Alle indexen zijn gedefinieerd en gedocumenteerd.
- [ ] De indexen zijn beoordeeld en goedgekeurd door minstens één teamlid.
- [ ] Indexen zijn aangemaakt.
- [ ] Indexen zijn gecontroleerd
- [ ] Indexen zijn geoptimaliseerd
- [ ] Indexen zorgen voor verbetering in de snelheid van de query

### Create scripten
- [ ] Is traceerbaar vanaf het PDM.
- [ ] Moet in een keer uitgevoerd kunnen worden.
- [ ] Bevat een create statement.
- [ ] Bevat een drop tabel if exists.
- [ ] Bevat keys.
- [ ] Bevat cascading.
- [ ] Bevat stored procedures.
- [ ] Bevat triggers.
- [ ] Bevat constraints.
- [ ] De naam van de script is in lower camelcase geschreven.

### Stored procedures
- [ ] Gebruiken sp voor de naam in kleine letters.
- [ ] De naam van de procedure word in lower camelcase geschreven.
- [ ] Word geunit test.
- 
### JSON - De JSONS die in MongoDB worden opgeslagen
- [ ] De JSONS bevatten een unieke naam.
- [ ] De unieke naam van een JSON word helemaal of gedeeltelijk gehaald uit zijn eigen data.
- [ ] De JSONS worden zo klein mogelijk gehouden door alleen de benodigde data op te slaan.

### Triggers
- [ ] Gebruiken nocount.
- [ ] Gebruiken tr voor de naam.
- [ ] De naam van de trigger word in lower camelcase geschreven.
- [ ] tr van de naam van de trigger word in kleine letters geschreven.
- [ ] Word geunit test.
- 
## CODE
- [ ] Alle code moet engels talig zijn.
- [ ] Branches gemaakt vanuit Jira ticket zodat de naamgeving consistent is.
- [ ] Pull Request aangemaakt.
- [ ] Pull Request bevat duidelijke commit messages.
- [ ] Pull Request worden gereviewd door minimaal één teamlid. 
- [ ] Alle tests slagen.
- [ ] De code is ingesprongen en bevat witregels.
- [ ] Tests en reviews worden uitgevoerd door een teamlid dat niet aan de code heeft gewerkt.
- [ ] Functies en variabelen worden in lowerCamelCase gemaakt.
- [ ] Klasse namen worden in UpperCamelCase gemaakt.

## Testen
- [ ] Testen zijn uitgevoerd.
- [ ] De testen testen nuttige functionaliteiten.
- [ ] Testresultaten zijn gedocumenteerd en opgeslagen in de `/doc` map.
- [ ] Testen zijn gereviewd door minimaal één teamlid.
- [ ] Testen zijn pas goedgekeurd na één keer feedback te hebben verwerkt.

## PvA
- [ ] Alle verplichte hoofdstukken volgens het voorbeeld document zijn aanwezig.
- [ ] Is in de nederlandse taal geschreven.

### Inleiding
- [ ] Bevat een projectomschrijving.
- [ ] Bevat het project groep.
- [ ] Bevat de opdrachtgever.

### Achtergrond van het project
- [ ] Beschrijft de aanleiding van het project.

### Doelstelling, Opdracht en op te leveren resultaten voor het bedrijf
- [ ] Bevat de doelstelling van het project.
- [ ] Bevat alles producten die opgelverd moeten worden.

### Projectgrenzen
- [ ] Bevat grenzen waarbinnen het project zich afspeelt.
- [ ] Bevat de scope van het project.
- [ ] De grenzen zijn zoveel mogelijk SMART geformuleerd.
- [ ] Bevat positieve grenzen.
- [ ] Bevat negatieve grenzen.

### Randvoorwaarden
- [ ] Bevat de randvoorwaarden van het project.
- [ ] Bevat voorwaarden van de locatie.
- [ ] Voor elk voorwaarde is iets of iemand verantwoordelijk.
- [ ] Voorwaarden zijn met 5xW 1xH geformuleerd.

### Op te leveren producten en kwaliteitseisen
- [ ] Bevat een tabel met alle opteleveren producten.
- [ ] Bevat per product de kwaliteitseisen.
- [ ] Kwaliteitseisen zijn SMART geformuleerd.
- [ ] Bevat per product benodigde activiteiten.
- [ ] Bevat per product proces kwaliteitseisen.
- [ ] Proces kwaliteitseisen zijn met 5xW 1xH geformuleerd.
- [ ] Beschrijft de rollen die tijdens het project aanwezig zijn.

### Ontwikkelmethode
- [ ] Bevat het proces waarmee het project wordt uitgevoerd.
- [ ] Het proces wordt uitgelegd.
- [ ] Bevat de fasen van het proces.
- [ ] Bevat de activiteiten van het proces.

### Projectorganisatie en communicatie
- [ ] Bevat de rollen die aanwezig zijn in het project.
- [ ] Bevat de verantwoordelijkheden van de rollen.
- [ ] Bevat de rolverdeling.
- [ ] Bevat afspraken gemaakt door het team.
- [ ] Bevat contactgegevens van alle betrokken personen.

### Planning
- [ ] Bevat een planning.
- [ ] Bevat een Gantt chart.
- [ ] Bevat een mijlpalenplanning.
- [ ] Alle feestdagen worden aangegeven.
- [ ] Alle vakanties worden aangegeven.

### Risico's
- [ ] Bevat een risicoanalyse.
- [ ] Risico's zijn realistisch.
- [ ] Bij elk risico word een kans ingeschat.
- [ ] Bij elk risico word een impact ingeschat.
- [ ] Bij elk risico word een tegenmaatregel gegeven.
- [ ] Bij elk risico word een uitwijkstrategie gegeven.

### Literatuurlijst
- [ ] Bevat alle bronnen die gebruikt zijn in het document.
- [ ] De bronnen zijn volgens APA geformateerd.







