<pre>
Gesprek met procesbegeleider (Chris Scholten) over code kwaliteit.

Concurrency
Is het delete van de JOBS transactie veilig?
Ja want er runnen nooit twee JOBS tegelijk.
Geen gebruik gemaakt van een transactie template in de delete procedures.
Maak gebruik van de transactie template als je meer dan één procedure gebruikt voor één actie.

Traceability
Voeg comments in de code toe die zeggen wat de procedures doen.
In het TO zetten welke procedure welke use cases beïnvloedden.
Traceability en goeie documentatie.
</pre>
