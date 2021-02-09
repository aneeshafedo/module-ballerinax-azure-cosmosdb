import ballerinax/cosmosdb;
import ballerina/log;
import ballerina/config;

cosmosdb:AzureCosmosConfiguration configuration = {
    baseUrl: config:getAsString("BASE_URL"),
    masterOrResourceToken: config:getAsString("MASTER_OR_RESOURCE_TOKEN")
};

cosmosdb:CoreClient azureCosmosClient = new (configuration);

public function main() {
    string databaseId = "my_database";
    string containerId = "my_container";
    string documentId = "my_document";
    int partitionKeyValue = 0;
    
    log:print("Read the  document by id");
    cosmosdb:Document returnedDocument = checkpanic azureCosmosClient->getDocument(databaseId, containerId, documentId, partitionKeyValue);
    log:print("Success!");
}
