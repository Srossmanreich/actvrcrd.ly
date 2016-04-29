#actvrcrd.ly
An Active Record development tool that helps you translate your schema design to ruby code.

##Version 1.0 (MVP)

Schema design and code output (for models and migrations) works for:

* Validations: 
	* Presence
	* Uniqueness

* Associations:
	* One-to-one
	* One-to-many
	* Many-to-many (with through)
	* Many-to-many (with has_and_belongs_to_many)
	* Polymorphic tables

The product includes basic css and forms and a unique identifier for your output as well as a unique short url 

##Planned updates:

* User experience
	* Unique URL to view and share your code
	* Ability to update existing tables before getting code
	* Upfront explanations of different table types
	* Automatic file creation
	* Better visual interface for schema design
	* Accounts for user input error (e.g., tries to get code before making tables, etc.)
	* Currently you must have at least one association
	* Remind users to include foreign_keys
	* Prevent user from doing impossible things (re: associations)
	* Add user guide (tips and tricks for using this tool)
	* Fix add more relationships bug

* Active Record functionality
	* Self Join tables
	* Breaking convention (e.g., with foreign_keys)

* Design
	* Better CSS?
	* Improve RESTfulness of routes
	* Add if xhr / ajax check in routes
	* Remove Current Table when all the tables are deleted

Want to contribute? Feel free to contact me via GitHub or by email: Srossmanreich@gmail.com
