# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


# Chart summarizing total exposures

# The number inside <nr> will be displayed in a large font,
# the label inside <label> will be shown underneath, in a smaller font.
# Variables:
#   $nr (number) - Number of unresolved exposures for the user
exposure-chart-heading =
    { $nr ->
        [one] <nr>{ $nr }</nr> <label>exponering</label>
       *[other] <nr>{ $nr }</nr> <label>exponeringar</label>
    }
# Variables:
#   $nr (number) - Number of fixed exposures found for the user
exposure-chart-heading-fixed = <nr>{ $nr }</nr> <label>Fixat</label>
exposure-chart-legend-heading-type = Exponering
exposure-chart-legend-heading-nr = Nummer
# Variables:
#   $nr (number) - Number of a particular type of exposure found for the user
exposure-chart-legend-value-nr = { $nr }×
exposure-chart-caption = Det här diagrammet visar hur många gånger din information har aktivt exponerats.
# Variables:
#   $total_fixed_exposures_num (number) - Number of fixed exposures
#   $total_exposures_num (number) - Number of total exposures
exposure-chart-caption-fixed = Det här diagrammet visar antalet exponeringar som är lösta ({ $total_fixed_exposures_num } av { $total_exposures_num })
exposure-chart-returning-user-upgrade-prompt = Hemadress, familjemedlemmar med mera är inte inkluderade ännu.
exposure-chart-returning-user-upgrade-prompt-cta = Starta en gratis skanning
exposure-chart-scan-in-progress-prompt = <b>Skanning pågår:</b> adress, familjemedlemmar och mer är inte inkluderade ännu.
modal-active-number-of-exposures-title = Om ditt antal aktiva exponeringar
# Variables:
#   $limit (number) - Number of email addresses included in the plan
modal-active-number-of-exposures-part-one-all =
    { $limit ->
        [one] Det här diagrammet visar det totala antalet gånger vi hittade varje typ av data exponerad för alla dataintrång för den e-postadress { $limit } som du för närvarande övervakar.
       *[other] Det här diagrammet visar det totala antalet gånger vi hittade varje typ av data exponerad för alla dataintrång för upp till { $limit } e-postadresser som du för närvarande övervakar.
    }
modal-active-number-of-exposures-part-two = Till exempel, om du har 10 exponeringar av ditt telefonnummer, kan det betyda att ett telefonnummer exponeras på 10 olika webbplatser eller så kan det betyda att 2 olika telefonnummer exponerades på 5 olika webbplatser.
modal-active-number-of-exposures-part-three-all = När de är lösta läggs de till ditt totala antal fasta exponeringar på sidan Fasta.
modal-cta-ok = OK
modal-open-alt = Öppna
modal-close-alt = Stäng
progress-card-heres-what-we-fixed-headline-all = Det här fixade du
progress-card-manually-fixed-headline = Manuellt fixad
dashboard-tab-label-action-needed = Åtgärd behövs
dashboard-tab-label-fixed = Fixad
dashboard-exposures-all-fixed-label = Allt fixat här!
dashboard-exposures-area-headline = Se alla webbplatser där din information är exponerad
# Note: this line precedes dashboard-exposures-area-description-all-line2.
# Variables:
#   $exposures_unresolved_num (number) - the unresolved number of exposures the user has.
dashboard-exposures-area-description-all-line1 =
    { $exposures_unresolved_num ->
        [one] Vi hittade { $exposures_unresolved_num } exponering av din data.
       *[other] Vi hittade { $exposures_unresolved_num } exponeringar av din data.
    }
# Note: this line follows dashboard-exposures-area-description-all-line1.
# Variables:
#   $data_breach_unresolved_num (number) - the unresolved number of data breaches the user has.
dashboard-exposures-area-description-all-line2 =
    { $data_breach_unresolved_num ->
        [one] Det förekom i { $data_breach_unresolved_num } dataintrång.
       *[other] Den förekom i { $data_breach_unresolved_num } dataintrång.
    }
dashboard-fixed-area-headline-all = Visa alla exponeringar som är fasta
# This is the label on a button that opens a popover menu, which shows a menu to adjust filters for the listed exposures.
dashboard-exposures-filter = Filter
dashboard-exposures-filter-company = Företag
dashboard-exposures-filter-date-found = Datum hittades
dashboard-exposures-filter-date-found-last-seven-days = Senaste 7 dagarna
dashboard-exposures-filter-date-found-last-thirty-days = Senaste 30 dagarna
dashboard-exposures-filter-date-found-last-year = Förra året
dashboard-exposures-filter-status = Status
dashboard-exposures-filter-status-action-needed = Åtgärd behövs
dashboard-exposures-filter-status-in-progress = Pågående
dashboard-exposures-filter-status-fixed = Fixad
popover-open-filter-settings-alt = Välj filter
dashboard-exposures-filter-show-all = Visa alla
dashboard-exposures-filter-show-results = Visa resultat
dashboard-exposures-filter-reset = Återställ

## Top banner on the dashboard

dashboard-top-banner-section-label = Sammanfattning av översikten
dashboard-top-banner-scan-in-progress-title = Din skanning pågår fortfarande
dashboard-top-banner-your-data-is-protected-title = Dina uppgifter är skyddade
dashboard-top-banner-your-data-is-protected-cta = Se vad som är fixat
dashboard-top-banner-lets-keep-protecting-title = Låt oss fortsätta skydda din data
# Variables:
# $exposures_unresolved_num is the remaining number of exposures the user has to resolve.
dashboard-top-banner-lets-keep-protecting-description =
    { $exposures_unresolved_num ->
        [one] Du har fortfarande { $exposures_unresolved_num } exponering kvar att fixa. Fortsätt och skydda dig själv. Vi guidar dig steg-för-steg.
       *[other] Du har fortfarande { $exposures_unresolved_num } exponeringar kvar att fixa. Fortsätt och skydda dig själv. Vi guidar dig steg-för-steg.
    }
dashboard-top-banner-lets-keep-protecting-cta = Låt oss fortsätta
# Note: this line is followed by `dashboard-top-banner-non-us-protect-your-data-description-line1`.
# Variables:
#   $exposures_unresolved_num (number) - the total number of exposures the user has.
dashboard-top-banner-non-us-protect-your-data-description-line1 =
    { $exposures_unresolved_num ->
        [one] Vi hittade { $exposures_unresolved_num } exponering av din data.
       *[other] Vi hittade { $exposures_unresolved_num } exponeringar av din data.
    }
# Note: this line is preceded by `dashboard-top-banner-non-us-protect-your-data-description-line1`.
# Variables:
#   $data_breach_unresolved_num (number) - the total number of data breaches the user has.
dashboard-top-banner-non-us-protect-your-data-description-line2 =
    { $data_breach_unresolved_num ->
        [one] Det förekom i { $data_breach_unresolved_num } dataintrång. Vi guidar dig steg-för-steg om hur du åtgärdar det.
       *[other] Den förekom i { $data_breach_unresolved_num } dataintrång. Vi guidar dig steg-för-steg om hur du åtgärdar det.
    }
dashboard-top-banner-no-exposures-found-title = Inga exponeringar hittades
dashboard-top-banner-non-us-no-exposures-found-description = Goda nyheter! Vi genomsökte alla kända dataintrång och hittade inga exponeringar. Vi kommer att fortsätta övervaka din e-postadress och kommer att varna dig om ett nytt intrång uppstår.
dashboard-no-exposures-label = Inga exponeringar hittades
# Variables:
# $exposures_resolved_num is the number of exposures the user has resolved.
dashboard-top-banner-non-us-your-data-is-protected-description =
    { $exposures_resolved_num ->
        [one] Bra jobbat, exponeringen av din data är fixad! Vi kommer att fortsätta övervaka och kommer att varna dig om eventuella nya exponeringar.
       *[other] Bra jobbat, alla { $exposures_resolved_num } exponeringar av din data är fixade! Vi kommer att fortsätta övervaka och kommer att varna dig om eventuella nya exponeringar.
    }
dashboard-top-banner-monitor-more-cta = Övervaka fler e-postmeddelanden

# About Exposure Statuses Modal

modal-exposure-status-title = Om exponeringsstatusar
modal-exposure-status-description-all = Vi söker efter exponeringar i alla kända dataintrång. Dina exponeringar kommer att ha en av följande statusar:
modal-exposure-status-action-needed = <b>Åtgärd behövs</b> innebär att den för närvarande är aktiv och du behöver vidta åtgärder för att åtgärda det.
modal-exposure-status-fixed = <b>Fixad</b> innebär att exponeringen har lösts och det finns inga åtgärder för dig att vidta.
