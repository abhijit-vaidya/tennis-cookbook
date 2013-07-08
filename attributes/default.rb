
default["tennis"]["ace"]["app_name"]                        = "tennis-ace"
default["tennis"]["ace"]["deploy_to"]                       = "/opt/tennis-ace"
default["tennis"]["ace"]["user"]                            = "ace"
default["tennis"]["ace"]["group"]                           = "ace"
default["tennis"]["ace"]["server_name"]                     = ["dev.local.tennis.com"]
default["tennis"]["ace"]["shared_dir"]                      = ::File.join(node["tennis"]["ace"]["deploy_to"], 'shared')
default["tennis"]["ace"]["log_dir"]                         = ::File.join(node["tennis"]["ace"]["shared_dir"], 'logs')


default["tennis"]["ace"]["create_dirs"]                     = [
                                                                node["tennis"]["ace"]["log_dir"],
                                                                ::File.join(node["tennis"]["ace"]["shared_dir"], 'uploads', 'wysiwyg')
                                                              ]

default["tennis"]["ace"]["uswgi"]["num_processes"]          = 1

default["tennis"]["ace"]["repo"]["url"]                     = "git@github.com:ZG-Tennis/Ace-CMS.git"
default["tennis"]["ace"]["repo"]["branch"]                  = "chef"
default["tennis"]["ace"]["repo"]["deploy_key"]              = "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----"

default["tennis"]["ace"]["db"]["host"]                      = "localhost"
default["tennis"]["ace"]["db"]["user"]                      = "tennis"
default["tennis"]["ace"]["db"]["name"]                      = "tennis"
default["tennis"]["ace"]["db"]["pass"]                      = "4tl4nt3nn15"
default["tennis"]["static"]["app_name"]                        = "tennis-static"
default["tennis"]["static"]["deploy_to"]                       = "/opt/tennis-static"
default["tennis"]["static"]["user"]                            = "ace"
default["tennis"]["static"]["group"]                           = "ace"
default["tennis"]["static"]["server_name"]                     = ["dev.local.tennis-static.com"]
default["tennis"]["static"]["shared_dir"]                      = ::File.join(node["tennis"]["static"]["deploy_to"], 'shared')
default["tennis"]["static"]["log_dir"]                         = ::File.join(node["tennis"]["static"]["shared_dir"], 'logs')


default["tennis"]["static"]["create_dirs"]                     = [
                                                                node["tennis"]["static"]["log_dir"],
                                                                ::File.join(node["tennis"]["static"]["shared_dir"], 'uploads', 'wysiwyg')
                                                              ]

default["tennis"]["static"]["uswgi"]["num_processes"]          = 1

default["tennis"]["static"]["repo"]["url"]                     = "git@github.com:ZG-Tennis/Ace-CMS-Static.git"
default["tennis"]["static"]["repo"]["branch"]                  = "dev"
default["tennis"]["static"]["repo"]["deploy_key"]              = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEAy6FS4IX9FtusKGWzdx9uexMiWA5aTckwFpHmjKmuasKgndKU\npea1bnoyYWvzRcCdG2o+HKRJfljlbX69rXY8K6+It59/VLACemmRVfX119nz/nOw\nwTeA5kAv23tCKbEi2Q7vCN6ro3xiCyejEPrGOvK+r7qzzUxwyTYPFwSqpXwU2SyQ\nX3ek2CuOkiJsmziElUwCFXOWob/5/uDdJ1bx/Ta9OcdsDfSesvQlSpnt6sHBiNAz\ne28eEGIcebFSp40KUUQwWjjOnuE0khhkM2y7Fbzwji2NDdnmpnkgm5v36uvFHCHb\nA6STlIGm912ZCEhGu8Ce3ZHGXIJ5E7ZDIvhYmwIDAQABAoIBAQCpyNVFh/LCwF8H\nP+UnifmgfQ/BxBXfjcSezQAigMiBE87ASPjQa1ET0Kd5O30Xx8Y3OZqYXxM4Wf7S\nET8uBsuc0Tt5f2+3uRoX3zXjKrXVSFF89BGIyTKcySAeLOO5x4x610zPZHpQUkGd\nc2svmSj3tbbw5wdMQlQ4MO7cDnQKjbHrfHmKcm3nUeAu44fci3VCnDbahh3Hwwcl\nMjfgDHYT8XRWaZbInb+bDGD1y8l0hv6YoqWVTzInZb1s2mn28czfe67Uo25mqTZS\n37d2f+qImnKwv9CvbqGfH6S9O5pDa4pnK0A1qJ4OrXiPkQigaG9PfqUrA7Gs2Kjg\nxEFEbZihAoGBAO5dX0M1kat1eCVW57hGuujhq3xJ6n8+11Yd9E/pHRUgLBilFtHB\nEuLtcStMLIwaMNr1CV5Cko4TiEm9mB1XGAteMD6tqxo5ah75IraPUgDrJtYlSgvJ\nnKFWUNPxUlg4JPbbeHLfuzmEcboWibEG9p7cTv3206arzZdZxxUbdwnHAoGBANqy\nFDm8Yo106qhJP27AAJHo8+NBNwLSAuY3HoZfsXK4nT2SDqtXySCkdIwO0iEH5s56\n4oT62Vd+qOP7TrcKlB9+daQNudJoPYyvvMFrZtLJn6niBxWhakv55Mgir+f/9L8P\nmBNgmtWwvJgrwmvjB++bndTzqzsttOlAvaRPSFqNAoGAWBkOgmqkIjjSZQqPrh4G\nKthtZwxyrQDu2ZdMmtRPuWUgpyMtIe04K8MSVqxaspVjhSmXgs0cGYLClm6KcB2m\nd10ie6f4W0LpI/V0jQC/kDNZMUCq81xalY6vZQYGJzDpCIvpIpvqOMHovpxh25n1\nQJWwZFD7vNg2rj+yQuzZvDUCgYEAkp7FlJfKcxApqr3A+11ahHhr2raETS3Dp9jY\nbDqH22QOd5MOpq1qOKpJQQVGt8J2aYRVjdYoFNLkJET+VxWOjTbZZC2XoYsliMbh\ng8Of4j4u/1R8b3ISs/FMAynOSXp++gFYcdVYuV+OcW8VIAPL9EaeoIDlEf3oxmET\nQ6+r0JkCgYAHdPaVJ1ElJjQAHUN9mm7V4RZgVaUdIrpFBtJ+lFSehHKwo1PRenyx\nbcwiHGOxJNGyrSBMtYuElDcp7rFRouelDoGDb0PLOR6SJ7HsGmx3JfmTgKEW8Izh\n4bbH3RdlNxB7UxjFRiRivPEuTiwrKCSMGQvEW5qwFTO+mf2rEyyzQA==\n-----END RSA PRIVATE KEY-----"


######nginx-uwsgi###########
default["ace"]["app_name"]                           = "ace"
default["ace"]["deploy_to"]                          = "/opt/tennis-ace"
default["ace"]["user"]                               = "ace"
default["ace"]["group"]                              = "ace"
default["ace"]["server_name"]                        = "local.tennis.com"
default["ace"]["wsgi"]                               = "wsgi/live_local.py"
default["ace"]["setting"]                            = "apps/settings_local.py"
default["ace"]["socket"]                             = "127.0.0.1:8080"
default["ace"]["virtualenv_path"]                    = "/opt/tennis-ace/shared/env"


default["ace_admin"]["app_name"]                           = "ace_admin"
default["ace_admin"]["wsgi"]                               = "wsgi/admin.py"
default["ace_admin"]["server_name"]                        = "ace.local.tennis.com"
default["ace_admin"]["socket"]                             = "127.0.0.1:9090"

default["ace_static"]["server_name"]                       = "static.local.tennis.com"
default["ace_static"]["app_name"]                           = "ace_static"

default["ace_upload"]["server_name"]                       = "uploads.local.tennis.com"
default["ace_upload"]["app_name"]                          = "ace_upload"
default["ace_upload"]["url"]                               = "http://artifacts.zgdev1.com"

# Application uWSGI Settings
default["ace"]["uswgi"]["num_processes"]              = 1
override["uwsgi"]["version"]                        = "1.4.4"
