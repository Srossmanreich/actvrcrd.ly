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

The product includes basic css and forms and a unique identifier for your output

##Planned updates:

* User experience
	* Unique URL to view and share your code
	* Ability to update existing tables
	* Upfront explanations of different table types
	* Automatic file creation
	* Better visual interface for schema design
	* Accounts for user input error (e.g., tries to get code before making tables, etc.)
	* Fix bugs related to refreshing
	* Currently you must have at least one association
	* Remind users to inclue foreign_keys
	* Prevent user from doing impossible things (re: associations)

* Active Record functionality
	* Polymorphic tables
	* Self Join tables
	* Breaking convention (e.g., with foreign_keys)

* Design
	* Better CSS?
	* Nicer table display

Want to contribute? Feel free to contact me via GitHub or by email: Srossmanreich@gmail.com
