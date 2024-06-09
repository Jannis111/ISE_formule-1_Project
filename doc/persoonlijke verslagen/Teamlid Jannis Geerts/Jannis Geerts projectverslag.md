## 1. Inleiding 
Binnen dit document ga ik in op mijn ervaringen en competenties tijdens het ISE-project. <br>

Voor het ISE-project gaan wij aan de slag als team A4 voor de opdrachtgever Jorg Jansen. 
Wij gaan een formule 1 database voor hem maken.
Deze formule 1 database moet meerdere informatieaanvragen tegelijk over de hele wereld aankunnen.
Deze database levert namelijk informatie over de formule 1 races aan klanten over de hele wereld.
Onder deze klanten vallen gebruikers die via de formule 1 website met een betaalde abbenoment zelf de informatie inzien.
Een andere groep klanten zijn de mensen die websites hosten en zelf de formule 1 informatie willen laten zien.
De informatie die de database moet kunnen laten zien zijn:
- Alle landen die meedoen aan de race.
- Alle circuit waar ooit is in geraced.
- Alle teams die ooit hebben meegedaan.
- Alle coureurs die hebben meegedaan aan de formule 1.
- De kwalificatie-uitslagen van een race
- De race uitslagen.
- Ophalen van een race planning.

De mensen die de formule 1 database gaan onderhouden moeten ook nieuwe informatie makkelijk kunnen gaan toevoegen. 
<br>
De database zelf bestaat uit drie onderdelen.
Het eerste onderdeel is de main database die alles gaat opslaan.
Deze database is een relationele database die gebruikt maakt van sql. 
Deze database wordt gemaakt door de meegegeven tekst te analyseren en hiervan een ontwerp te maken powerdesigner.

Het tweede onderdeel bestaat uit een non-relationele database die alle json informatie opslaat.
Dit is het onderdeel dat de informatie direct lever aan de gebruiker.

Het derde onderdeel is een API tussen de relationele database en non-relationele database in.
Deze API zorgt ervoor dat ze met elkaar kunnen communiceren.

Er zijn een paar dingen die mij lastig lijken in dit project.
Dat zijn de API maken tussen de twee databases in, de non-relationele database maken en het onderzoek naar wat voor database wij voor de staging area willen.
Het maken van de API en non-relationele database lijken mij lastig aangezien ik daar minder ervaring in heb. 
In het onderzoeken van iets ben ik nooit zo goed in geweest en doe ik er langer over dan mijn andere studie genoten.

De twee leerdoelen die ik heb voor het ISE-project zijn mijn besluitvormingsvaardigheden te verbeteren en het ontvangen van feedback en het daadwerkelijk toepassen van deze feedback zodat ik beter wordt op zowel gedrag als op producten.
## 2. Onderbouwd oordeel over de kwaliteiten van de deelproducten

### PVA
Persoonlijk vind ik dat het plan van aanpak hier en daar wat beter kan, maar wel voldoende is.
Ons PVA bereikt het doel van een plan van aanpak, namelijk het verschaffen van duidelijkheid aan zowel het team als de opdrachtgever over de werkwijze en de te leveren resultaten.
Alle essentiële hoofdstukken die in een PVA thuishoren, zijn aanwezig.
Daarnaast voldoet elk onderdeel van het PVA aan onze Definition of Done (zie Oordeel kwaliteit PVA Jannis Geerts.md in de bijlage) en aan de op te leveren producten en kwaliteitseisen die in ons PVA zijn beschreven.

Toch zijn er verbeterpunten.
Er zijn bijvoorbeeld veel risico's geweest die niet voldoende zijn uitgewerkt in het PVA, zoals zieke teamleden of een procesbegeleider die het te druk had, waardoor we hem maar één keer per week konden zien.
Hierdoor ontbrak een goed proces om dergelijke problemen op te lossen.
Daarnaast klopte onze planning in het PVA niet, wat een slordige fout is.
Ook waren sommige zinnen in het hoofdstuk over de op te leveren producten en kwaliteitseisen niet SMART geformuleerd.

Samenvattend, hoewel ons PVA voldoet aan de belangrijkste eisen en richtlijnen, zijn er zeker nog punten die beter hadden kunnen zijn.
### FO
Het functioneel ontwerp (FO) wordt door mij als redelijk goed beoordeeld.
Dit komt doordat het FO als doel heeft een gedetailleerde blauwdruk te bieden van hoe het systeem zal functioneren, met als uiteindelijk doel ervoor te zorgen dat het eindproduct voldoet aan de behoeften van de opdrachtgever en duidelijkheid te verschaffen over hoe wij denken dat het systeem in elkaar zou moeten zitten.

Ons FO voldoet aan deze eisen door alle benodigde dingen te bevatten die hiervoor duidelijkheid zorgen, zoals:
- De functionele eisen en een use case diagram om aan te geven waaraan het systeem moet voldoen en wat het moet kunnen.
- Gedetailleerde uitwerking van de use cases, inclusief fully dressed use cases om de functionaliteit en acties van het systeem te beschrijven.
- Verwoordingen, analyse en ontleding van de verwoordingen, het Conceptueel Data Model (CDM) dat is opgesteld op basis van de ontleden verwoordingen. Deze zijn belangrijk voor het FO aangezien zij cruciaal zijn voor de ontwikkeling van de relationele database.
- Beslissingen en onderbouwingen met betrekking tot het CDM en de verwoordingen, wat bijdraagt aan traceerbaarheid en de kwaliteit van het FO.
- Uitleg waar alle tabellen en attribute voorstaan.
- Uitwerking van business rules en constraints om de implementatie van de business rules te beschrijven.
- Een overzichtsschema van de rollen en hun rechten binnen het systeem.

Alle onderdelen van het FO voldoen aan ons Definition of Done (DoD) en onze op te leveren producten en kwaliteitseisen in ons PVA.
Daarom zijn ze van kwaliteit.
Meer informatie over waarom ik vind dat het FO van goede kwaliteit is volgens ons DoD is te vinden in de bijlage van het bestand "Oordeel kwaliteit FO Jannis Geerts".

### TO
Persoonlijk vind ik het technisch ontwerp dat wij hebben opgesteld redelijk goed.
Dit vind ik, omdat het doel van een technisch ontwerp is om een gedetailleerde blauwdruk te bieden voor het ontwikkelen, implementeren en beheren van het systeem.
Ons TO voldoet aan deze vereisten door:
- Non-functionele requirements te specificeren, met uitwerkingen, waardoor duidelijk wordt waaraan het systeem moet voldoen en hoe het aan deze eisen voldoet.
- Een architectuuroverzicht te bieden waarin alle componenten van ons systeem worden weergegeven, zodat de structuur van het systeem duidelijk wordt wat zorgt voor traceability en beter kwaliteit.
- Een PDM (Physical Data Model) op te nemen met daaronder tabellen die de betekenis van elk attribuut beschrijven, wat inzicht geeft in de opbouw van onze relationele database.
- Integrity Rules te definiëren die duidelijkheid verschaffen over de implementatie van de business rules.
- Uitgebreide uitleg te geven over complexe code en onderdelen, zodat iemand die niet eerder met het systeem heeft gewerkt, het kan begrijpen en uitbreiden.
- Indexes te documenteren, inclusief uitleg over de locatie en redenen voor hun gebruik, wat duidelijkheid biedt over de gemaakte keuzes tijdens de ontwikkeling en zorgt voor traceerbaarheid en hogere kwaliteit.
- Een onderdeel te hebben die aangeeft welke onderdelen zijn voltooid en welke niet, wat bijdraagt aan betere traceerbaarheid en kwaliteit.

Alle onderdelen van het TO voldoen naar mijn mening ook aan het DoD waardoor ze van kwaliteit zijn.
Zie(Oordeel kwaliteit TO Jannis Geerts) in de bijlage map voor details.

### code
Persoonlijk vind ik dat onze code van redelijk goede kwaliteit is, aangezien deze flexibel, goed leesbaar, consistent, voldoende getest, modulair, goed gedocumenteerd en redelijk robuust tegen verschillende invoeren is.
Bijvoorbeeld, de procedure SP_sendJsonToApi gebruikt parameters om het JSON-formaat aan te maken en vult deze wanneer de procedure door de job wordt aangeroepen.
Hierdoor kan deze procedure in verschillende situaties worden aangeroepen zonder zelf aangepast te hoeven worden, wat zorgt voor flexibiliteit en modulariteit.

Ook roept de job om de halve minuut een procedure aan in de execute schema tabel als daar een procedure staat.
Door deze opzet kan een nieuwe procedure worden toegevoegd zonder andere onderdelen aan te passen, wat de code wederom flexibel en modulair maakt.

Voor het schrijven van procedures hebben wij de templates van school gebruikt om consistentie te waarborgen en concurrency mogelijk te maken.
Voor elke procedure, trigger en constraint hebben we minimaal één unittests geschreven, wat de code voldoende getest maakt.
De algemene procedures voor de CRUD-use cases zijn relatief eenvoudig en niet complex, waardoor ze goed leesbaar zijn.

Onze code voldoet aan de eisen en kwaliteitscriteria die zijn vastgelegd in hoofdstuk 6 van het PVA, evenals aan mijn persoonlijke kwaliteitsbeoordeling.
Meer informatie over de kwaliteit van onze code is te vinden in mijn beoordeling "Oordeel kwaliteit Code Jannis Geerts".

Een ding dat minder goed is aan onze code is dat wij de school template voor concurrency voor de triggers niet hebben toegepast.
### testplan en testrapport
Ik vind ons testplan en testrapport redelijk.
Het testplan geeft duidelijk aan wat er getest moet worden en wat niet, waardoor wij een duidelijk testproces hebben.
Het testrapport presenteert ook duidelijk de resultaten van de uitgevoerde tests, inclusief foto's van de resultaten van de tests.

In mijn beoordeling van de testkwaliteit, zoals beschreven in "Oordeel kwaliteit testen Jannis Geerts", heb ik onderbouwd waarom ik het testen redelijk vind.

## 3. Kwaliteit eindproduct
Het eindproduct dat wij volgens ons Plan van Aanpak (PVA) zouden opleveren, was een formule-1 database die uit drie onderdelen bestond: een relationele database die alle data opslaat, een API die zorgde voor communicatie tussen de twee databases, en een non-relationele database waarmee later nog dingen gedaan konden worden.
Ons eindproduct hoort ook een samenstelling van verschillende deelproducten te bevatte waaronder valt: het PVA, het Functioneel Ontwerp (FO), het Technisch Ontwerp (TO), de code, en het testplan met testrapport.

Over het algemeen vind ik dat wat wij hebben opgeleverd voldoende is.
Wij hebben een systeem gemaakt dat via een procedure die alleen bereikbaar is via een rol data kan toevoegen in de relationele database en deze doorstuurt naar de API om vervolgens in de non-relationele mongoDB te komen.
Het valt grotendeels binnen wat we hadden beloofd in ons PVA, de scope van de opdrachtgever en het Definition of Done (DoD).
Hoewel de opdrachtgever hier en daar een paar functionaliteiten heeft moeten laten vallen vanwege tijdgebrek, is de overdraagbaarheid van het geheel redelijk.
We hebben geprobeerd alles redelijk traceerbaar te maken en de belangrijkste zaken goed te documenteren in het FO, TO en testplan.
De ingewikkelde procedures en functionaliteiten zijn goed gedocumenteerd, wat toekomstige ontwikkelaars helpt bij het uitbreiden en onderhouden van het systeem.
Er zijn echter nog een paar inconsistenties in de documentatie en slordigheidsfouten in enkele onderdelen, die de traceerbaarheid enigszins bemoeilijken.

Samenvattend hebben we een samenhangend en grotendeels traceerbaar eindproduct opgeleverd dat voldoet aan de meeste eisen uit ons PVA en DoD.
Er zijn echter enkele verbeterpunten, met name op het gebied van documentatie, proces en enkele ontbrekende functionaliteiten, die de tevredenheid van de opdrachtgever en de overdraagbaarheid van het systeem verder hadden kunnen verbeteren.
## 4. Evaluatie projectmethode
In het plan van aanpak kun je in H7 lezen over wat rup inhoudt en hoe wij rup combineren met sommige artefacten van scrum.
In dit hoofdstuk ga ik kijken of de RUP-fases nuttig was voor ons project.

### inception fase
De inception fase is bij ons niet goed verlopen.
We hadden nog niet alle aspecten die volgens ons PVA duidelijk moesten zijn goed uitgewerkt of over nagedacht.
Bijvoorbeeld, de projectscope, risico's en bijbehorende maatregelen waren nog niet uitgebreid genoeg uitgewerkt.
Ook was het groepsproces die wij moesten maken niet volledig gedefinieerd.
Hierdoor hadden wij in de inception fase niet goed genoeg beeld gekregen van het hele project.

Specifiek wat betreft de projectscope hadden we een verkeerd beeld van hoe de staging area eruit moest komen te zien.
Dit kwam doordat we niet vaak genoeg onze voortgang aan de opdrachtgever hebben getoond, waardoor we verkeerde aannames hebben gemaakt over wat nodig was.
Bovendien waren er misverstanden tijdens de gesprekken met de opdrachtgever, wat ervoor heeft gezorgd dat wij een nog verkeerder beeld kregen van het project.
### elaboration fase
De elaboration fase is nog slechter verlopen en voldeed niet aan onze PVA.
Volgens het PVA zouden we een architectuur moeten hebben opgesteld, de requirements verder uitgewerkt moeten hebben en een ontwikkelomgeving met een prototype moeten hebben opgezet.
Hoewel we een architectuurplaatje hadden, was dit alleen in het verkeerde diagram.
Bovendien hadden we geen goed beeld van de kritische requirements.
Ons begrip van hoe de staging area eruit moest zien was verkeerd, waardoor de opdrachtgever aan het einde van de elaboration fase ons moest uitleggen hoe de staging area eruit moest zien en wat erin moest.

Vanwege miscommunicatie en specifieke eisen van de opdrachtgever zijn we eerst volgens de watervalmethode gaan werken en hebben we voor alle bijlage verwoordingen geschreven.
Pas aan het einde van de elaboration fase, voordat deze werd uitgebreid, zijn we weer overgestapt op normaal RUP-werk en per use case gaan werken.

Vervolgens hebben we de elaboration fase met tweeënhalve dag verlengd om de staging area en alles daaromheen goed te krijgen.
Aan het einde van deze uitgebreide elaboration fase kwamen wij er opnieuw achter dat ons oorspronkelijke beeld niet correct was.
Dit kwam opnieuw door een gebrek aan duidelijke communicatie met de docenten over wat zij precies verwachtten.

### Construction fase
De constructiefase verliep daaraan tegen veel beter.
Volgens ons PVA moesten we in deze fase alle functionaliteiten opleveren die de opdrachtgever aan ons voorstelde.
Dit hebben we ook grotendeels gedaan op een business rule en een attribuut na.
Daarnaast hebben we in de constructiefase alle fouten opgelost die we in de elaboratie- en inception fase hadden gemaakt.

We hebben alle feedback van het tussentijdse verslag toegepast en meer vragen gesteld aan de opdrachtgever om zeker te zijn dat onze visie overeenkwam met zijn wensen.
We hebben alle documentatie bijgewerkt, de traceerbaarheid verbeterd en het proces geoptimaliseerd.

De constructiefase hebben we in twee sprints opgesplitst, waarin we de gewenste functionaliteiten van de opdrachtgever hebben uitgewerkt.
### Transition fase
De transition fase verliep ook vrij goed, hoewel deze redelijk kort was.
We beschouwden deze fase als minder belangrijk en gebruikten de tijd liever voor de constructiefase en het toevoegen van meer functionaliteit.

Volgens ons PVA moesten we in de transition fase de documentatie op orde brengen en de puntjes op de i zetten.
Dit hebben we gedaan, maar we hebben het grootste deel van de tijd besteed aan het werkend krijgen van de laatste functionaliteiten.

In conclusie kunnen we stellen dat de transition fase efficiënt is verlopen.
We hebben zowel de documentatie afgerond als de resterende functionaliteiten succesvol geïmplementeerd.
Hierdoor hebben we het project mooi kunnen inleveren.
## 5. Rol binnen het project
Mijn rol binnen het project omvat de functies van informatie-analist, programmeur en tester.
Volgens ons PVA ben ik als informatie-analist verantwoordelijk voor het opstellen van de requirements die betrekking hebben op de opdracht.
Als programmeur ben ik verantwoordelijk voor de ontwikkeling en documentatie van het eindproduct.
Als tester ben ik verantwoordelijk voor het opstellen van een testplan, het schrijven van unittests en het documenteren van de tests.

De rol van informatie-analist past echter niet goed bij mij, omdat ik moeite heb met het nauwkeurig bepalen waaraan het project moet voldoen en hoe ik dit in requirements moet omzetten.
Bovendien vind ik het documenteren en opschrijven van de requirements niet leuk.

De rollen van programmeur en tester passen daarentegen beter bij mij.
Ik vind programmeren en het schrijven van unittests erg leuk. Mijn kennis van procedures, triggers, constraints en unittests is goed, waardoor ik verwacht dat ik deze rollen goed kan vervullen.

Wat ik minder leuk vind aan de rollen van programmeur en tester is het documenteren van de tests en de code om de traceability hoog te houden, evenals het opstellen van het testplan.
Ik heb vaak moeite met het uitschrijven van gedetailleerde stappenplannen om te volgen.
### Tussentijds
Als informatie-analist heb ik samen met Dylano de functionele en non-functionele eisen opgesteld.
Daarnaast heb ik de verwoordingen voor bijlage D gemaakt, geanalyseerd en in het CDM en PDM gezet.
Door de verwoordingen strak te formuleren en de beslissingen goed te documenteren, hebben we een redelijk CDM, PDM en create-script kunnen opleveren.

Voor de use case "toevoegen-race-uitslagen" heb ik de casus en bijbehorende CSV opnieuw doorgenomen om de verwoordingen, CDM en PDM aanpassingen te maken.
Ik heb ook extra aandacht besteed aan de correctheid van de aanpassingen die teamgenoten hebben gemaakt aan de functionele en non-functionele eisen.
Voor de rollen van programmeur en tester heb ik in de elaboration fase nog weinig taken kunnen uitvoeren.

Helaas heb ik niet goed in kaart kunnen brengen wat we moesten doen qua requirements en de scope van het project.
Dit leidde tot een verkeerd beeld van wat we moesten opleveren, waardoor onze tussentijdse oplevering stroef verliep.
Voor de eindoplevering ga ik de requirements en scope van het project samen met mijn team nauwkeurig bepalen.
Een belangrijke les voor de toekomst is om elke keer dat ik verwoordingen, CDM of PDM heb afgerond, deze door een docent te laten controleren om zeker te weten dat ze correct zijn.

### Eind
Aan het einde van het project heb ik meer bijgedragen aan het coderen en testen geleverd.
Als programmeur heb ik procedures geschreven zoals SP_addDeelnemendeCour, SP_addLap, SP_updateDeelnemendeCour en SP_updateLap.
Deze procedures gebruiken het procedure template van school, waardoor ze openstaan voor het toepassen van concurrency indien nodig.
Ik heb ervoor gekozen geen uitleg voor deze procedures te schrijven, hoewel dit eigenlijk wel hoorde volgens ons PVA, omdat het simpele CRUD-procedures zijn die andere programmeurs makkelijk zouden moeten begrijpen.
Als programmeur heb ik goed bijgedragen aan zowel de code als de documentatie, wat heeft bijgedragen aan een redelijke eindoplevering.

Voor het testen heb ik voor mijn stukken code minstens één unittest geschreven.
Ook heb ik mijn teamgenoten begeleid bij het maken van unittests en hen verteld wat ze moesten unittesten.
Helaas heb ik geen testplan geschreven, hoewel dit wel moest volgens ons PVA.
Dit heeft een andere teamgenoot pas laat in het project gedaan.
Doordat het testplan er zo laat bij kwam, hadden we niet echt een proces voor het testen, wat de kwaliteit van sommige tests heeft verminderd.

Samen met mijn team heb ik de requirements en scope goed in beeld gebracht door continu vragen te stellen aan de opdrachtgever en procesbegeleider.
Dit zorgde ervoor dat we tijdens een sprint review niet weer verrast werden door dingen die niet waren zoals de opdrachtgever wilde of dingen die ontbraken.

Wat ik heb geleerd uit mijn rollen is dat je goed moet beginnen met een proces en je daaraan moet houden.
Voor zowel de rol van programmeur, tester als informatie-analist heb ik ervaren dat het ontbreken van een goed proces aan het begin tot problemen leidt.
Bij het testen ontbrak er lange tijd een testplan wat zorgde voor lagere kwaliteit testen, bij het programmeren moesten we aan het eind nog veel documentatie opschrijven en we liepen erg in de mist doordat we de scope en de requirements niet goed in beeld hadden.
Al deze zaken zouden beter zijn verlopen als we ze vanaf het begin goed hadden aangepakt met een proces en ons daaraan hadden gehouden.
## 6. Competenties
In dit hoofdstuk ga ik het hebben over verschillende situatie waarmee ik aantoon dat ik de competenties ISEP-2, ISEP-3, ISEP-4 en ISEP-5 behaald heb.
De competenties ga ik met behulp van mijn factsheet(zie Factsheet Jannis Geerts) heb ik toelichting geven voor alle competenties.
### ISEP-02
<i>
Je maakt een analyse van de eisen en wensen voor een informatiesysteem en stelt
op basis van deze analyse een dynamisch model en een statisch model (d.w.z.
conceptueel datamodel inclusief business rules) op en documenteert deze in een
functioneel ontwerp.
</i>
<br>
<h5>
Situatiebeschrijving: Analyse van bijlage D
</h5>
Bijlage D heb ik geanalyseerd en ontleed door eerst de tekst door te nemen en de bijbehorende CSV-bestanden en verwoordingen ervan te maken.
Vervolgens heb ik de verwoordingen laten controleren door de opdrachtgever die als domein expert speelde.
Hierdoor wist ik zeker dat de verwoordingen klopte en dat ik door kon gaan anders als ik er later achter kwam de de verwoordingen niet klopte kon ik weer het CDM en PDM aanpassen.
Nadat hij de verwoordingen goed had gekeurd heb ik ze geontleed in entiteittypes en attribute.
Vervolgens heb ik de ontleden verwoordingen in een CDM gestopt.
Daarna heb ik het CDM omgezet naar en PDM en dat PDM weer om naar een create script.
Ik heb een specifieke keuze gemaakt om land en circuit een apart ET te maken om consistentie te verhogen en data vervuiling tegen te gaan.
Ook heb ik de keuze gemaakt om de primary key van race de startdatum te maken en het circuit. 
Ik heb hiervoor gekozen, omdat er meerdere race in een jaar kunnen voorkomen op hetzelfde circuit.
Op deze manier blijft de primary key unique.

<h5>
Situatiebeschrijving: Business rules
</h5>
In het Functioneel Ontwerp (FO) heb ik business rules 3 tot en met 6 opgesteld en constraints 3 tot en met 6 uitgewerkt.
Het uitwerken van business rules en constraints is nuttig omdat dit een blauwdruk vormt voor de tabellen waarop deze regels van toepassing zijn.
Hierdoor kun je de code voor deze business rules gemakkelijker schrijven.

Een van de business rules die ik heb voorgesteld, is dat het volgnummer in de tabel 'deelnemendeCoureur' uniek moet zijn per race, zoals in de bijlage is aangegeven.
Het is echter niet mogelijk om dit als primary key te gebruiken, omdat het volgnummer van een coureur kan veranderen of zelfs vervallen als de coureur stopt met de Formule 1, waardoor het niet langer uniek zou zijn.

Daarom heb ik besloten om dit als een business rule op te nemen.
Ik heb ervoor gekozen om constraint 3 op de tabel 'deelnemendeCoureur' te plaatsen, omdat je de attributen startdatum, circuit en volgnummer nodig hebt om te controleren of het volgnummer uniek is per race.

### ISEP-03
<i>
Je stelt een technisch ontwerp op voor het te ontwikkelen informatiesysteem dat consistent is met het functioneel ontwerp en motiveert de ontwerpbeslissingen in relatie tot met de requirements.
</i>
<h5>
Situatiebeschrijving: Integrity Rules
</h5>
In het Technisch Ontwerp (TO) heb ik een deel van de Integrity rules uitgewerkt.
Ik heb besloten dat R3 een trigger moet zijn op de tabel 'deelnemendeCoureur' die controleert of het volgnummer uniek is per race.
Daarnaast moet R5 een trigger zijn die controleert of de geboortedatum plus 16 jaar groter is dan de startdatum.

Ik heb ervoor gekozen om deze regels als triggers te implementeren omdat ze te complex zijn om met een constraint af te vangen.
Als we deze regels in procedures zouden plaatsen, zou de code verspreid staan over meerdere procedures in de vorm van if-statements.
Het voordeel van een trigger is dat je alle logica mooi op één plek hebt staan.

Het uitwerken van de Integrity rules zorgt ervoor dat je een goed idee krijgt van hoe je deze regels in code moet implementeren.
<h5>
Situatiebeschrijving: PDM genereren
</h5>
In het technische ontwerp staat een foto van het PDM.
Deze PDM heb ik laten generen vanuit het CDM en een paar kleine aanpassingen gemaakt.
Ik heb de varchar datatype voor naam omgezet naar nvarchar, omdat als je bijvoorbeeld een coureur wilt opslaan met een speciaal teken in de naam zou dat niet kunnen met varchar.
Ook heb ik een paar namen van de attribute aangepast zodat ze niet allemaal land heten in coureur.
Het PDM is goed, omdat het cruciaal is voor het generen van een goede relationele database create script.

### ISEP-04
<i>Je bewaakt continu de kwaliteit van het ontwerp en van het te ontwikkelen
systeem.</i>

<h5> Situatiebeschrijving: reviewen analyse A Jira taak 23 </h5>
Ik heb meerdere keren een andere persoonstaak gereviewd.
Elke keer dat ik iets moest reviewen hield ik het bijbehorende gedeelte van het definition of done erbij om te kijken of de taak hieraan voldeed. 
Bij het reviewen van de taak analyse A heb ik eerst rustig de zinnen doorgenomen.
Vervolgens toen ik een paar zinnen tegen kwam waarvan ik dacht dat het fout was of beter kon, heb ik het besproken met Dylano of hij het kon onderbouwen waarom het zo moest.
Zo niet gaf ik hierop feedback van wat ik dacht dat het moest zijn.

### ISEP-05
<i>
 Je implementeert in teamverband het informatiesysteem in overeenstemming met het ontwerp ervan, zorgt voor traceerbaarheid tussen ontwerp en implementatie en motiveert eventuele afwijkingen.
</i>
<h5>Situatiebeschrijving: toevoegen-race-uitslagen</h5>
Ik heb de code geschreven voor het toevoegen van een race-uitslag.
Ik heb hierbij gebruik gemaakt van de school procedure template om het mogelijk te maken om concurrency toe te passen voor later. 
De procedures zelf zijn niet heel ingewikkeld waardoor er niet echt veel beslissingen zijn voor gemaakt.
Ik heb ook een paar unittest geschreven voor de procedures die testen of de procedure slaagt.

<h5>Situatiebeschrijving: bussines rules</h5>
Ik heb een paar business rules geschreven, die ik vervolgens heb uitgewerkt in constrains en integrity Rules en dan in code.
De code voor de rules komen precies overheen met de integrity rules die ik had uitgewerkt.
Ik heb ervoor gekozen om beidde rules te maken in een trigger.
Dit heb ik gedaan, omdat de rules te complex zijn voor een constraint en als je hem in de procedures neerzet als if statements zou je de code op allemaal verschillende plekken hebben staan.
Door de trigger heb je de code mooi op één plek wat zorgt voor meer overzichtelijkheid.

## 7. Leerdoelen
Binnen dit hoofdstuk ga ik het hebben over de twee leerdoelen die ik heb gekozen voor dit project.
Leerdoel besluitvormingsvaardigheden verbeteren en leerdoel constructieve feedback ontvangen verbeteren.
De leerdoelen zijn uitgebreider omschreven in het bestand (Leerdoel Jannis Geerts) in de bijlage map.

### MetaSTARRT leerdoel besluitvormingsvaardigheden verbeteren
Omdat ik merkte dat ik vaak te snel meeging met de mening van een ander persoon waardoor wij soms op slechtere beslissingen kwamen, mijn perspectief niet werd meegenomen en ik minder aanwezig was waardoor ik minder door had waar wij waren in het project. 
Heb ik gekozen voor dit leerdoel.

Na het project wil ik in staat zijn om mijn eigen mening en standpunten toe te voegen aan een discussie en niet meteen met de mening van anderen mee te gaan. 
Om dit te bereiken heb ik concrete acties ondernomen waarover je kunt lezen in mijn STARRT Reflectie Jannis Geerts.
De lessen die ik heb geleerd tijdens dit project die mij helpen mijn besluitvormingsvaardigheden te verbeteren zijn:

- Het toepassen van het BOB-model samen met conflicthantering om het behouden en communiceren van mijn standpunt makkelijker te maken.
- Direct mijn mening/standpunt naar voren te brengen om te voorkomen dat ik direct met de mening/standpunt van anderen meega.
- Al mijn standpunten meteen te onderbouwen.
- Mijn eigen standpunt naar voren te brengen als iemand anders dat doet.
- Mijn kennis van het project op peil te brengen door me in te lezen over de relevante onderwerpen.

Door al deze acties te combineren, kan ik nu redelijk goed mijn standpunt naar voren brengen en behouden, wat heeft geleid tot betere beslissingen in het project.
Het nadeel hiervan was echter dat het veel tijd kostte vanwege voortdurende discussies en meningsverschillen, wat soms irritatie veroorzaakte.

Om mijn leerdoel verder te verbeteren, zou ik in de toekomst een goede balans moeten vinden tussen het naar voren brengen van mijn standpunt en het in overweging nemen van de mening van anderen.
### MetaSTARRT leerdoel constructieve feedback ontvangen
Tijdens mijn vorige OOSE-projecten viel het mij op dat ik moeite had met het ontvangen van feedback en ook daadwerkelijk beter worden in het ding waar feedback op gegeven was. 
Hierdoor loop ik mogelijk kansen mis om te groeien en mijn producten te verbeteren en daarom heb ik gekozen voor dit leerdoel.

Om beter te worden in het ontvangen van constructieve feedback en deze daadwerkelijk toe te passen om mijn vaardigheden te verbeteren, heb ik concrete acties ondernomen, waarover je in detail kunt lezen in het bestand STARRT Reflectie Jannis Geerts.
De lessen die ik heb geleerd tijdens dit project die mij helpen beter te worden in het ontvangen van constructieve feedback zijn:
- Doorvragen om duidelijkheid te krijgen over de feedback en om tips te krijgen over hoe ik de feedback kan toepassen.
- Niet direct in de verdediging schieten of excuses maken voor de feedback, om te voorkomen dat ik de feedback negeer of naast mij zet.
- Het opschrijven van concrete acties tijdens het ontvangen van feedback, om te focussen op oplossingen in plaats van excuses te maken en in de verdediging te schieten.
- Het toepassen van de concrete acties om beter te worden in de gebieden waar feedback is gegeven.

Door al deze acties te combineren, kan ik nu redelijk goed feedback ontvangen en verwerken, wat heeft geleid tot persoonlijke verbeteringen en een betere samenwerking in het team.
## 8. Conclusie
Ik ben van mening dat wij nog een voldoende eindproduct hebben kunnen opleveren na de tussentijdse oplevering en ik ben hierop uitgebreid ingegaan op mijn redenen hiervoor in Hoofdstuk 2 en 3 van mijn verslag.
Daarnaast ben ik van mening dat ons groepsproces in het begin van het project echt slecht was, maar aan het einde best wel goed.
Verder ben ik van mening dat wij de RUP-methode in de inception en elaboration fase slecht hebben toegepast en in de constructie en transitie fase goed hadden toegepast mijn reden hiervoor is te lezen in hoofdstuk 4 van mijn verslag.

Als ik terug kijk na wat ik allemaal heb gedaan in dit project heb ik veel dingen geleerd.
Ik ben beter geworden in mijn leerdoel besluitvormingsvaardigheden en het ontvangen van feedback zoals je kan lezen in H7 van dit verslag.
Ik heb geleerd wat een API precies doet en hoe deze in elkaar zit, hoe concurrency werkt en wat je moet doen voordat je concurrency kunt toepassen.
Daarnaast heb ik geleerd hoe het RUP precies in elkaar zit, hoe je het moet toepassen en wat het verschil is tussen RUP en SCRUM.

Ook ben ik redelijk tevreden over waar ik sta voor bijna alle competenties in dit project.
Ik heb namelijk de competenties **ISEP-01**, **ISEP-02**, **ISEP-04**, **ISEP-06** en **ISEP-07** goed aangetoond.
Voor **ISEP-01** heb ik de ontwikkelmethode RUP toegepast en de sprint planning artifact van SCRUM overgenomen in de vorm van een jira bord,
Voor **ISEP-02** heb ik veel verwoordingen gemaakt, omgezet naar CDM die vervolgens naar PDM, dan naar create script en elke stap documentatie geschreven over bepaalde beslissingen.
Voor **ISEP-04** heb ik meerdere taken gereviewd en het DoD aangepast.
Voor **ISEP-06** heb ik mijn team geholpen om ons aan het process te houden en ik heb feedback gegeven bij elke IPF.
Voor **ISEP-07** heb ik mijzelf verdiept in mijn leerdoel, het begrijpen van concurrency, RUP en hoe een API werkt.
**ISEP-03** en **ISEP-05** konden daarentegen wat beter.
Voor **ISEP-03** heb ik het CDM gemaakt en een paar business rules, maar doordat wij tijd te kort hadden en onze taken slecht hadden ingedeel heb ik niet zoveel meer gedaan in het TO.
Voor **ISEP-05** heb ik ontwerpen gemaakt en daarop code geschreven, maar niet zoveel.
Ook valt het een beetje tegen hoeveel documentatie ik ervoor heb geschreven.
Dit komt grotendeels doordat de code die ik had geschreven redelijk eenvoudig te begrijpen was en het niet nodig was om hiervoor uitgebreide documentatie te schrijven.
Ik ga dieper in op al deze competenties in mijn factsheet.
## 9. Factsheet
De factsheet waar mijn bijdrage in staat is te vinden in de bijlage onder Factsheet Jannis Geerts.

## Bronnenlijst
Remi-Armand Collaris en Eef Dekker, remi-armand.collaris@ordina.nl. (z.d.). RUP op maat. http://www.rupopmaat.nl/
