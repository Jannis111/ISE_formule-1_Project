# DoD Beoordeling 12-04-2024


UML Moet CDM en PDM worden.
Alles wat wij maken moet van goeie kwaliteit zijn.
Er zijn deels kwaliteitseisen.
Maar er moeten geen werkwijzens in staan want dat is niet relevant voor de opdrachtgever.
Er moet hier meer afgedwongen worden over de kwaliteiten zelf van de producten.
Een kwaliteits eis kan zijn dat alles traceerbaar moet zijn.
Zinnen analiseren, busines roles, stored procedures, triggers, constraints, indexes, views, functions, usecasaes.
De onderdelen die hier in komen te staan kunnen geplaatst worden als taak in het Jira bord. 

## Functioneel ontwerp
Usecase diagrams
Fullydressed usecases
Zinnen maken/opstellen
Zinnen analiseren
CDM
Business rules
Matrix met rollen en rechten


## Technisch ontwerp
Architectuur ontwerp
PDM
Integriteitsregels
Matrix met grants en revokes
Datatypens/domeinen
Indexen


Create scripten
Stored procedures
Triggers
Stageing area code


## Zinnen maken
- Zin klopt syntactisch
- Een zin moet elementair zijn

## Triggers
- Gebruik template van DI //anders zelf een maken




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
- [ ] Het document is beoordeeld en goedgekeurd door minstens twee teamleden.

### Architectuur ontwerp
- [ ] Het architectuurontwerp is duidelijk gedefinieerd en gedocumenteerd.
- [ ] Het architectuurontwerp is beoordeeld en goedgekeurd door minstens twee teamleden.

### PDM
- [ ] Het fysieke datamodel (PDM) is compleet en nauwkeurig.
- [ ] Het PDM is beoordeeld en goedgekeurd door minstens twee teamleden.

### Integriteitsregels
- [ ] Alle integriteitsregels zijn gedefinieerd en gedocumenteerd.
- [ ] De integriteitsregels zijn beoordeeld en goedgekeurd door minstens twee teamleden.

### Matrix met grants en revokes
- [ ] De matrix met grants en revokes is compleet en nauwkeurig.
- [ ] De matrix is beoordeeld en goedgekeurd door minstens twee teamleden.

### Datatypens/domeinen
- [ ] Alle datatypen en domeinen zijn gedefinieerd en gedocumenteerd.
- [ ] De datatypen en domeinen zijn beoordeeld en goedgekeurd door minstens twee teamleden.

### Indexen
- [ ] Alle indexen zijn gedefinieerd en gedocumenteerd.
- [ ] De indexen zijn beoordeeld en goedgekeurd door minstens twee teamleden.
- [ ] Indexen zijn aangemaakt.
- [ ] Indexen zijn gecontroleerd
- [ ] Indexen zijn geoptimaliseerd
- [ ] Indexen zorgen voor verbetering in de snelheid van de query

### Create scripten
- [ ] Is traceerbaar vanaf het PDM.
- [ ] Is hufter proef.
- [ ] Bevat een create statement.
- [ ] Bevat een drop tabel if exists.
- [ ] Bevat keys.
- [ ] Bevat cascading.

### Stored procedures
- [ ] Gebruiken SP voor de naam.

### Triggers
- [ ] Gebruiken nocount.
- [ ] Gebruiken Tr voor de naam.