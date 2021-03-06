$[/myProject/perlHeader]

adminLogin();

my $name = getProperty("/myParent/project_name");

$ec->abortOnError(0);

my $code = $ec->getProject($name)->findvalue("//code")->value();
if ($code eq "NoSuchProject") {
    error("Project '$name' doesn't exist");
}

my $key = getProperty("/projects/$name/ec_versioning_artifact");
if ($key eq "") {
    error("Project '$name' is not being versioned");
}

$code = $ec->getArtifact("VersionedProjects:$key")->findvalue("//code")->value();
if ($code eq "NoSuchArtifact") {
    error("Versioning artifact for project '$name' doesn't exist");
}

$ec->abortOnError(1);
