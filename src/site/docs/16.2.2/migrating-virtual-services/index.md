---
title: Migrating Virtual Services
layout: default
---
Vantage allows virtual services to easily be migrated from one Avi Service Engine (SE) to another. This capability can be useful in cases where an Avi SE needs to be disabled. For example, an Avi SE host may need to be disabled for maintenance.

Using the steps in this article, the virtual services on an Avi SE can be migrated to another Avi SE. The migration is transparent to end users of the virtual service. Existing sessions continue with very minimal or no perceived interruption.

## Migrating an Individual Virtual Service

1. Navigate to Applications &gt; Virtual Services.
1. Click on the name of the virtual service you want to migrate.
<img src="img/migrate-single-vs-selectit.png" alt="migrate-single-vs-selectit">
1. Hover the mouse over the name of the virtual service to display the quick edit menu for the virtual service.
1. Click Migrate.
<img src="img/migrate-single-vs.png" alt="migrate-single-vs">
1. Select the Avi SE to which to migrate the virtual service.
<img src="img/migrate-single-vs-targetse.png" alt="migrate-single-vs-targetse">

Vantage shows the progress of the migration:
<img src="img/migrate-single-vs-status.png" alt="migrate-single-vs-status">

Note: If no other SEs are available, click Create Service Engine and select the host on which to create the SE.

## Migrating All Virtual Services

1. Navigate to Infrastructure &gt; Clouds.
1. Click on the cloud name.
1. Select the checkbox next to the Avi SE to be disabled.
1. Click Disable.
<img src="img/migrate-all-vs.png" alt="migrate-all-vs">

Vantage migrates all virtual services that are on the disabled Avi SE to another SE. (Generally, this takes several minutes.) After all the virtual services have been migrated, the Avi SE is disabled and its health icon turns to grey. To view the virtual services that are on a remaining SE, including any migrated virtual services, click on the row for the SE (not on the SE name).

Note: For more on disabling Avi SEs, click <a href="/docs/latest/disable-se">here</a>.