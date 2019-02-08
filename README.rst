
Torrone
======

Ruby client to JasperReports API.

Currently, only does compilation of JRXML files and generation of PDF reports.


Installation
------------

After installing the gem::

    gem install torrone

Usage
-----

Before doing anything, you should configure Torrone::

    Torrone::Config.configure do |config|
      config.jasper_dir = "/dir/of/reports"
    end

Having a compiled jasper file, you can generate a PDF report::

    array_of_bytes = Torrone::Report.generate('emails',
	    data: [
	      { email: 'foo@bar.com' },
	      { email: 'foo2@bar.com'},
	      { email: 'foo3@bar.com'}
	    ]
    )

it returns an array of bytes.

You can also pass a hash of custom/specifics parameters, just like this:

    array_of_bytes = Torrone::Report.generate('emails',
	    data: [
	      { email: 'foo@bar.com' },
	      { email: 'foo2@bar.com'},
	      { email: 'foo3@bar.com'}
	    ],
	    params: {'COMPANY_NAME' => 'My company name'}
    )

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
