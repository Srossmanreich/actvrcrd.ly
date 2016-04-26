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

* Active Record functionality
	* Polymorphic tables
	* Self Join tables
	* Breaking convention (e.g., with foreign_keys)

* Design
	* Better CSS

Want to contribute? Feel free to contact me via GitHub or by email: Srossmanreich@gmail.com
