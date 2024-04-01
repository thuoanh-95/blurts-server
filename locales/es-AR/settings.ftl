# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


# Settings page

settings-page-title = Opciones de { -product-short-name }

## Breach alert preferences

settings-alert-preferences-title = Preferencias de alerta de filtraciones
settings-alert-preferences-option-one = Enviar alertas de filtración a la dirección de correo electrónico afectada
settings-alert-preferences-option-two = Enviar todas las alertas de filtración a la dirección de correo electrónico primaria

## Monitored email addresses

settings-email-list-title = Direcciones de correo electrónico monitoreadas
# Variables:
#   $limit (number) - Number of email addresses included in the plan
settings-email-limit-info =
    { $limit ->
        [one] Tu cuenta incluye monitoreo de hasta { $limit } correo electrónico.
        [many] Tu cuenta incluye monitoreo de hasta { $limit } correos electrónicos.
       *[other] Tu cuenta incluye monitoreo de hasta { $limit } correos electrónicos.
    }
settings-email-verification-callout = Verificación de correo electrónico requerida
settings-resend-email-verification-link = Reenviar correo electrónico de verificación
settings-add-email-button = Agregar dirección de correo electrónico
settings-remove-email-button-label = Eliminar
# Variables:
#   $emailAddress (string) - The email address to remove, e.g. `billnye@example.com`
settings-remove-email-button-tooltip = Dejar de monitorear { $emailAddress }

# This string is shown beneath each of the user’s email addresses to indicate
# how many known breaches that email address was found in.
# Variables:
#   $breachCount (number) - Number of breaches
settings-email-number-of-breaches-info =
    { $breachCount ->
        [one] Aparece en { $breachCount } filtración conocida.
        [many] Aparece en { $breachCount } filtraciones conocidas.
       *[other] Aparece en { $breachCount } filtraciones conocidas.
    }

## Cancel Premium subscription

## Deactivate account

settings-deactivate-account-title = Desactivar cuenta
settings-deactivate-account-info-2 = Podés desactivar { -product-short-name } borrando tu { -brand-mozilla-account }.
settings-fxa-link-label-3 = Ir a ajustes de la { -brand-mozilla-account }

## Delete Monitor account

settings-delete-monitor-free-account-title = Eliminar la cuenta de { -brand-monitor }
settings-delete-monitor-free-account-description = Esto eliminará permanentemente tu cuenta de { -brand-monitor } y desactivará todas las notificaciones.
settings-delete-monitor-free-account-cta-label = Eliminar la cuenta
settings-delete-monitor-free-account-dialog-title = Tu cuenta de { -brand-monitor } se eliminará para siempre
settings-delete-monitor-free-account-dialog-lead = Se eliminará toda la información de tu cuenta de { -brand-monitor } y ya no controlaremos nuevas violaciones de datos. Esto no eliminará tu cuenta de { -brand-mozilla }.
settings-delete-monitor-free-account-dialog-cta-label = Eliminar la cuenta
settings-delete-monitor-free-account-dialog-cancel-button-label = No importa, volvamos
settings-delete-monitor-account-confirmation-toast-label-2 = Se eliminó tu cuenta de { -brand-monitor }.
settings-delete-monitor-account-confirmation-toast-dismiss-label = Descartar

## Add email dialog

## Unsubscribe Dialog Survey

