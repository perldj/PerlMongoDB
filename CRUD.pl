use MongoDB;

# Connect to the local database
my $client = MongoDB->connect('mongodb://localhost');

# Add something to the database

my $collection = $client->ns('databaseName.collectionName'); 
my $result     = $collection->insert_one( { "Item" => "Value" }  );
# my $result     = $collection->insert_one( \%Items  ); # ALternative, just to add a hash.


# Will create these if they don't exist
my $db = $client->get_database("databaseName");
my $coll = $db->get_collection("collectionName");

# Find all in collection
my $cursor = $coll->find;

# Iterate through records found
while ( my $record = $cursor->next ) {
   print "Record is $record\n";
}

