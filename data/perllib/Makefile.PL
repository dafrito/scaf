use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => "@@PROJECT@@",
    VERSION_FROM      => "lib/@@PROJECT_MODULE_PATH@@/@@PROJECT_MODULE@@.pm",
);
