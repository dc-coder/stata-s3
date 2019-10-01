// Stata + Simple Storage Solution + Shell Scripts

// Laundry list of command line instructions that could be useful.

// Get the operating system
dis "`c(os)'"

// Get the path for aws-cli
shell which aws

// List objects in my bucket

global profile = "s3-stata"
global bucket = "wbg-stata"
global output = "table"

shell aws s3api list-objects-v2 --bucket $bucket --profile $profile --output table

// List top level objects in my bucket

// List objects in my bucket and ignore a prefix (logs)

// List objects in my bucket under a specific prefix

// List example, limit to x (for large buckets)

// Display output in json, table or text
// Save output of list to json or csv

// Get a file
// Get the meta data of the file
// Get part of a file based on a select

// Upload a file
global objectname = "README.md"
global filename = "README.md"
global storageclass = "STANDARD"

shell aws s3api put-object --bucket $bucket --key $objectname --body $filename  --profile $profile


// Upload a large file

// Upload a folder (sync)
// Download a folder

// Delete a file

// Check if file has a previous version
