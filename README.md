# stata-s3
Experimental Stata code that works with S3 buckets  and does not pretend that buckets are file shares (uses shell + s3api)

There are basically two approaches that I can think of for now.  
1- call the command line or shell and make the default/amazon S3 tool do the work.  
2- build the request to the S3 api using curl or similar. Includes more work, has more risk for large files (multipart uploads) and such, since it does not rely on AWS maintainted tooling. Advantage, if windows ships with curl these days, user may not need to install anything.

## Method 1

**Call the command line or shell and make the default/amazon S3 tool do the work.**

Assumption: the user has aws command line installed and configured.

**Decisions**:

I compared `aws s3 cp` vs `aws s3api put-object` for example. The `s3api` is lower level and kinda had nicer outputs (those outputs can also be formatted as table, json etc... which is neater)... 

so decision 1, use `s3api` for simple things like upload an object, download it, delete it etc...

decision 2: I quick checked, s3api does not have sync - so when the time comes for featuers like downloading a full folder or uploading it, use to `aws s3`

**Proof of concept**

on the regular terminal do `which aws`, this will give you the path with aws is installed, use it as a parameter to shell. For example:

`shell  /xx/xxx/bin/aws s3api put-object --bucket bucket-name --body /path/to/local/file.txt --key file.txt`

## Method 2

Will try to use curl.
