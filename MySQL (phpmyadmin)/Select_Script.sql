/*Alle Artikel mit Einkaufspreis, Verkaufspreis (Endkunde,Schüler,Händler):*/
select a.ArtikelID, a.Einkaufspreis, a.Verkaufspreis as 'Endkundenpreis',
round((a.Verkaufspreis*0.8),2) as 'Schülerpreis',
round((a.Verkaufspreis*0.85),2) as 'Händlerpreis' from Artikel a

/*UMSATZ UNTERKATEGORIE APPLE*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Kategorie Apple in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=1 and b.BestellstatusID!=1

/*UMSATZ UNTERKATEGORIE SAMSUNG*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Kategorie Samsung in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=2 and b.BestellstatusID!=1

/*UMSATZ UNTERKATEGORIE KLEIDER MÄNNER*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Kategorie Herrenkleider in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=3 and b.BestellstatusID!=1

/*UMSATZ UNTERKATEGORIE KLEIDER FRAUEN*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Kategorie Frauenkleider in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=4 and b.BestellstatusID!=1

/*UMSATZ OBERKATEGORIE ELEKTRONISCHE GERÄTE*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Kategorie Elektronische Geräte in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=1 or a.UnterkategorieID=2 and b.BestellstatusID!=1

/*UMSATZ OBERKATEGORIE KLEIDER*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Kategorie Kleider in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=4 or a.UnterkategorieID=3 and b.BestellstatusID!=1

/*UMSATZ VON ALLEN ARTIKELN*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz aller Kategorien in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=1 or a.UnterkategorieID=2 or a.UnterkategorieID=4 or a.UnterkategorieID=3 and b.BestellstatusID!=1

/*Umsatz Preisgruppe Schüler*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Preisgruppe Schüler'
from Artikel a
join Bestellungen b on a.ArtikelID=b.ArtikelID
join Kunde k on b.KundenID=k.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where p.PreisgruppenID=1

/*Umsatz Preisgruppe Endkunde*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Preisgruppe Endkunde'
from Artikel a
join Bestellungen b on a.ArtikelID=b.ArtikelID
join Kunde k on b.KundenID=k.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where p.PreisgruppenID=2

/*Umsatz Preisgruppe Händler*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as 'Umsatz der Preisgruppe Endkunde'
from Artikel a
join Bestellungen b on a.ArtikelID=b.ArtikelID
join Kunde k on b.KundenID=k.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where p.PreisgruppenID=3

/*PREISE DER KATEGORIE APPLE ÄNDERN*/
select ArtikelBeschreibung, Verkaufspreis as 'Preis ohne Prozent',
round((Verkaufspreis*0.8),2) as 'Apple Artikel um 20% reduzieren'
from Artikel where UnterkategorieID=1

/*PREISE DER KATEGORIE SAMSUNG ÄNDERN*/
select ArtikelBeschreibung, Verkaufspreis as 'Preis ohne Prozent',
round((Verkaufspreis*0.8),2) as 'Samsung Artikel um 20% reduzieren'
from Artikel where UnterkategorieID=2

/*PREISE DER KATEGORIE HERRENKLEIDER ÄNDERN*/
select ArtikelBeschreibung, Verkaufspreis as 'Preis ohne Prozent',
round((Verkaufspreis*0.8),2) as 'Herrenkleider um 20% reduzieren'
from Artikel where UnterkategorieID=3

/*PREISE DER KATEGORIE DAMENKLEIDER ÄNDERN*/
select ArtikelBeschreibung, Verkaufspreis as 'Preis ohne Prozent',
round((Verkaufspreis*0.8),2) as 'Damenkleider um 20% reduzieren'
from Artikel where UnterkategorieID=4

/*PREISE DER KATEGORIE ELEKTRONISCHE GERÄTE ÄNDERN*/
select ArtikelBeschreibung, Verkaufspreis as 'Preis ohne Prozent',
round((Verkaufspreis*0.8),2) as 'Artikel Elektronische Geräte um 20% reduzieren'
from Artikel where UnterkategorieID=2 or UnterkategorieID=1

/*PREISE DER KATEGORIE KLEIDER ÄNDERN*/
select ArtikelBeschreibung, Verkaufspreis as 'Preis ohne Prozent',
round((Verkaufspreis*0.8),2) as 'Artikel Kleider um 20% reduzieren'
from Artikel where UnterkategorieID=3 or UnterkategorieID=4

/*PREISE ALLER KATEGORIEN ÄNDERN*/
select ArtikelBeschreibung, Verkaufspreis as 'Preis ohne Prozent',
round((Verkaufspreis*0.8),2) as 'Alle Artikel um 20% reduzieren'
from Artikel where UnterkategorieID=1 or UnterkategorieID=2 or UnterkategorieID=3 or UnterkategorieID=4

/*DURCHSCHNITTS UMSATZ ALLER ARTIKEL AVG*/
select round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis)/count(distinct(b.ArtikelID)),2) as 'Durchschnittlicher Umsatz pro Artikel in CHF'
from Artikel a
join Bestellungen b on b.ArtikelID=a.ArtikelID
join Kunde k on k.KundenID=b.KundenID
join Preisgruppen p on p.PreisgruppenID=k.PreisgruppenID
where a.UnterkategorieID=1 or a.UnterkategorieID=2 or a.UnterkategorieID=4 or a.UnterkategorieID=3
and b.BestellstatusID!=1

/*MIN Umsatz pro Artikel*/
select top 1 ArtikelBeschreibung, min(tief) as 'Tiefster Umsatz aller Artikeln' from (
select a.ArtikelBeschreibung,
round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as tief 
from Artikel as a 
join Bestellungen as b on b.ArtikelID=a.ArtikelID 
join Kunde as k on k.KundenID=b.KundenID 
join Preisgruppen as p on p.PreisgruppenID=k.PreisgruppenID 
where a.UnterkategorieID=2 or a.UnterkategorieID=1 or 
a.UnterkategorieID=4 or a.UnterkategorieID=3 and b.BestellstatusID!=1
Group BY a.ArtikelBeschreibung,a.ArtikelID) s group by ArtikelBeschreibung order by 2;

/*MAX Umsatz pro Artikel*/
select top 1 ArtikelBeschreibung, max(tief) as 'Tiefster Umsatz aller Artikeln' from (
select a.ArtikelBeschreibung,
round(sum((a.Verkaufspreis*p.PreisReduktion)-a.Einkaufspreis),2) as tief 
from Artikel as a 
join Bestellungen as b on b.ArtikelID=a.ArtikelID 
join Kunde as k on k.KundenID=b.KundenID 
join Preisgruppen as p on p.PreisgruppenID=k.PreisgruppenID 
where a.UnterkategorieID=2 or a.UnterkategorieID=1 or 
a.UnterkategorieID=4 or a.UnterkategorieID=3 and b.BestellstatusID!=1
Group BY a.ArtikelBeschreibung,a.ArtikelID) s group by ArtikelBeschreibung order by [Tiefster Umsatz aller Artikeln] desc;


/*Datensätze die älter als 30 Tage sind mit dem Vermerk: in Bearbeitung*/
delete from Bestellungen where BestellZeitpunkt < dateadd(day, -30, getdate()) and BestellstatusID = 1;
