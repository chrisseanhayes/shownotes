# Creating Many To Many Relationships
## Summary
One to Many relationships are what we have already explored up to this time. You have one record that is related to many other records. One Sponsor can have many Contacts. One Contact or Sponsor can have many Notes. But what happens when you have many Events that relate to many Contacts? That's what we'll discuss here.

While One to Many relationships only require two tables, Many to Many relationships require three.
This involves creating an intermediate or association table linking the two tables together. In our
case we are creating a new table to store church events. In this table we store events at the church, services, gatherings, bible studies. There will be "many" events. Contacts may attend many events. We
will be able to assign many contacts to many events. From the perspective of an event we will be able
to see all the contacts that attended. From the perspective of the contact we will be able to see
events they attended.
## Creating the Events table
- Open a `mysql` prompt execute the following:
```
USE contactoutreach;
```
```
CREATE TABLE events (
  `id` int NOT NULL AUTO_INCREMENT,
  `eventdate` date NOT NULL,
  `eventtypid` int NOT NULL,
  `description` varchar(255),
  PRIMARY KEY (`id`)
);
```
> Take notice that there is no related foreign keys in this table for contacts. Ask yourself "how will we relate this event to a contact, or more?" Also see that there is a foreign key for `eventtype`. We will be creating a short lookup table for this foreign key.

- Let's create the lookup table for event types:
```
CREATE TABLE eventtypes(
  `id` int NOT NULL AUTO_INCREMENT,
  `eventname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);
```
> this is a very simple table for enforcing event type on the user. Why would we do this? Primarily to avoid data entry errors. When one is asked to enter "Evening Worship Service" you can imagine how many different ways it could be misspelled. I misspelled misspelled typing these notes. Let's help our users by requiring them to select the type of service so we will later be able to aggregate or report on them.
## Add the tables to MS Access
- Add these two tables to MS Access. see: [View and edit MySql tables in MS Access](../../2024-06-21/shownotes.md)
- Add lookup table for event type. see: [Adding a lookup for our sponsors](../../2024-06-22/shownotes.md)
## Create the intermediate table
> A table is needed to bridge between Contacts and Events. This table contains the relationship to the contact, the relationship to the event and maybe details about that specific intersection.
- Create the table:
```
CREATE TABLE contactattendance(
  `id` int NOT NULL AUTO_INCREMENT,
  `contactid` int NOT NULL,
  `eventid` int NOT NULL,
  PRIMARY KEY (`id`)
);
```
## Add attendance table to MS Access
- Add this table to MS Access. see: [View and edit MySql tables in MS Access](../../2024-06-21/shownotes.md)
## Create a view of the events to enable viewing the event type name.
> We want to see the event type name but it's not in the events table, it's in a lookup table. How will we do this? By creating a view.
## Add lookups in table view
- Add lookup table for both contact and event. see: [Adding a lookup for our sponsors](../../2024-06-22/shownotes.md)
