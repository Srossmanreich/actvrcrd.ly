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
	* Ability to update existing tables before getting code
	* Automatic file creation
	* Better visual interface for schema design
	* Prevent user from doing impossible things (re: associations)
	* Add user guide (tips and tricks for using this tool)
	* Upfront explanations of different table types
	* Remove many-to-many table if one of the tables associated with it is deleted

* Active Record functionality
	* Self Join tables
	* Breaking convention (e.g., with foreign_keys)

* Design
	* Better CSS?
	* Improve RESTfulness of routes
	* Add if xhr / ajax check in routes

Want to contribute? Feel free to contact me via GitHub or by email: Srossmanreich@gmail.com
