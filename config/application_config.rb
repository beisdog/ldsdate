configatron.community_name = "LDS Date (Europe)"
configatron.app_host = "localhost"
configatron.support_email =  "ldsdate@beisert-btc.de"
configatron.min_age = 18
configatron.photo.paperclip_options.storage = "s3"
configatron.photo.paperclip_options.path =  "/:style/:id/:filename"
configatron.photo.paperclip_options.s3_credentials = "#{Rails.root}/config/s3.yml"


configatron.photo.paperclip_options.styles.thumb.geometry = '100x100#'
configatron.photo.paperclip_options.styles.thumb.geometry = '100x100#'

configatron.photo.paperclip_options.styles.medium.geometry = '290x320#'
configatron.photo.paperclip_options.styles.large.geometry = '465>'

#configatron.facebook.key = '251444061613474'
#configatron.facebook.secret = '7ad4d7b96f8cf4ec4d545739a6fa5e6f'
#configatron.facebook.callback_url = "http://www.ldsgig.com/auth/facebook"

# for localhost
#configatron.facebook.key = '371180202996665'
#configatron.facebook.secret = '	4008a552192018b918525e22d84fe136'
#configatron.facebook.callback_url = "http://localhost:3000/auth/facebook"



# for localhost - when in Facebook.com present parameter App Domains:ldsdate.dev and in /etc/hosts add "127.0.0.1       ldsdate.dev"
configatron.facebook.key = '128679700667376'
configatron.facebook.secret = '80bb0673c8ff741a2a05513592573758'
configatron.facebook.callback_url = "http://ldsdate.dev/auth/facebook"
