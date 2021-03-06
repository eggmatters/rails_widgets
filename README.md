# Billing Application

The billing service was written in Ruby on Rails:

* Ruby version - ruby 2.5.1p57 (2018-03-29 revision 63029)
* Rails 5.2.0

The rails engine was scaffolded, but does not rely on ActiveRecord (database persistence)

There is, presently, only one route, generating a report with random data (see programming_assesment.docx)

## Install

### Locally
unpack, checkout or clone project

run 
```
$ bundle install
$ ./bin/rails server -d
```

### Docker
```
$ docker build -t billing-app ./
$ docker run -it billing-app
```

From either installation, navigate to http://localhost:3000

### Tests
All tests were written in RSpec:

run 
```
rake spec
```

## Application

The core structure of the application is held in 2 distinct Libraries:

* lib/company_model.rb
* lib/reports.rb

### company_model.rb
This is a class which other models will derive from, namely, the Seller (direct), Affiliate & Reseller classes.

It defines the functionality all sellers shall share: a name, a sale price per item, their type and a method to calculate cost.

### reports.rb
This is a Ruby Module which drives the generation of orders and reports as outlined in the programming_assessment document. The data generated
by this module would typically come from user interaction (i.e. orders) and a database (company definitions). 

The reports service generates static instances of 6 companies, and then randomly generates the required 100 orders, randomly assigning a company
to each order. 

A report is generated which creates a hash of accumulated sales totals for each company.

### Reports Controller
This is the only entry point into this system and is routed as root. It serves 2 endpoints:

```
URI Pattern                          Controller#Action
GET  /reports/index(.:format)        reports#index {:format=>"json"}
GET  /                               reports#index
```

The '/' route serves the html index.erb template, the /reports/index route serves the report JSON generated by the reports library.

### Models

#### affiliate.rb
Extends from Company (company_model lib) defines "cost" method, which determines the "breakage" for billing Widgets & 
overrides total_cost, determining cost of widgets

#### reseller.rb
Extends Company, overrides total_cost

#### seller.rb
Extends Company, overrides total_cost Model representing the direct seller

#### order.rb
Represents an order made, tracking company amount paid & date placed.

## Rendering
An initial route request at the root level sends the index.html.erb template. This is a static template.
It loads bootstrap framework, JQuery, custom css & js. 

On load, an ajax request is made to fetch the reports json. The data is rendered in a table & totals are calculated. 

