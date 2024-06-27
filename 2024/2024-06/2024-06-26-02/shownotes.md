# Adding notes for contacts
## Prerequisites
- Starting off from where we left off in our series. See: [Show Notes](../2024-06-22/shownotes.md)
## Create the Notes table
- Set the database context, at the prompt:
```
USE contactoutreach;
```
- Execute the following sql at the prompt:
```
CREATE TABLE Notes(
  `id` int NOT NULL AUTO_INCREMENT,
  `contactid` int NOT NULL,
  `sponsorid` int NOT NULL,
  `notetext` varchar(1000) NOT NULL,
  `notedate` date NOT NULL,
  PRIMARY KEY (`id`)
);
```
- Take note of the two foriegn keys:
  - contactid: this will be used to link to the contact
  - sponsorid: this will be used to link to the sponsor
- To see about adding the ComboBox Lookup see notes: [Linked Tables](../2024-06-22/shownotes.sql)
- Make a lookup for Contact ID
- Make a lookup for Sponsor ID
