## CTA Bus Route and Stop Viewer

A simple Rails application for viewing bus stops and routes.  Data was gathered from the CTA website and parsed into a useful format so it can be interacted with through the application.

The raw data and it's well-formed outputs can be found in `/lib`.  The data was parsed and inserted using the rake tasks in `/lib/task`.

If the database is not populated when the repo is cloned, you can simple rerun the rake tasks to repopulate the database.  The process should go fairly quickly as the data are inserted in large batches.