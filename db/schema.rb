# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130617191350) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "action",     :limit => 50
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
  end

  add_index "activities", ["created_at"], :name => "index_activities_on_created_at"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "additional_infos", :force => true do |t|
    t.string  "want_kids"
    t.integer "body_type_id"
    t.integer "user_id"
    t.string  "bodytype"
    t.string  "height"
    t.boolean "show_weight"
    t.text    "looks"
    t.integer "hair_color_id"
    t.integer "eye_color_id"
    t.integer "attractiveness_id"
    t.text    "handicap"
    t.boolean "show_handicap"
    t.string  "ward"
    t.string  "stake"
    t.integer "relationship_status_id"
    t.integer "education_id"
    t.text    "occupation"
    t.text    "university"
  end

  create_table "ads", :force => true do |t|
    t.string   "name"
    t.text     "html"
    t.integer  "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location"
    t.boolean  "published",        :default => false
    t.boolean  "time_constrained", :default => false
    t.string   "audience",         :default => "all"
  end

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "view_count"
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "text"
    t.text     "short_text"
    t.text     "help_text"
    t.integer  "weight"
    t.string   "response_class"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.boolean  "is_exclusive"
    t.integer  "display_length"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "default_value"
    t.string   "api_id"
    t.string   "display_type"
  end

  add_index "answers", ["api_id"], :name => "uq_answers_api_id", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.integer  "width"
    t.integer  "height"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "thumbnail"
    t.integer  "parent_id"
    t.datetime "asset_updated_at"
  end

  create_table "attractivenesses", :force => true do |t|
    t.string "name"
  end

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "picture_url"
    t.string   "access_token"
    t.string   "access_token_secret"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "body_types", :force => true do |t|
    t.string "name"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
    t.text   "tips"
    t.string "new_post_text"
    t.string "nav_text"
  end

  create_table "choices", :force => true do |t|
    t.integer "poll_id"
    t.string  "description"
    t.integer "votes_count", :default => 0
  end

  create_table "clippings", :force => true do |t|
    t.string   "url"
    t.integer  "user_id"
    t.string   "image_url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "favorited_count", :default => 0
  end

  add_index "clippings", ["created_at"], :name => "index_clippings_on_created_at"

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "comment"
    t.string   "author_name"
    t.string   "author_email"
    t.string   "author_url"
    t.string   "author_ip"
    t.boolean  "notify_by_email",  :default => true
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["created_at"], :name => "index_comments_on_created_at"
  add_index "comments", ["recipient_id"], :name => "index_comments_on_recipient_id"
  add_index "comments", ["user_id"], :name => "fk_comments_user"

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "dependencies", :force => true do |t|
    t.integer  "question_id"
    t.integer  "question_group_id"
    t.string   "rule"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "dependency_conditions", :force => true do |t|
    t.integer  "dependency_id"
    t.string   "rule_key"
    t.integer  "question_id"
    t.string   "operator"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "drinks", :force => true do |t|
    t.string "name"
  end

  create_table "educations", :force => true do |t|
    t.string "name"
  end

  create_table "essays", :force => true do |t|
    t.text    "about_me"
    t.text    "looking_for"
    t.text    "contact_my_if"
    t.text    "influential_person"
    t.text    "notice_about"
    t.text    "wish_to_notice"
    t.text    "five_things"
    t.text    "leisure_time"
    t.text    "passionate_about"
    t.text    "thankfull_for"
    t.text    "friends_say"
    t.text    "friday_night"
    t.integer "user_id"
  end

  create_table "ethnicities", :force => true do |t|
    t.string "name"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.integer  "metro_area_id"
    t.string   "location"
    t.boolean  "allow_rsvp",    :default => true
  end

  create_table "eyes_colors", :force => true do |t|
    t.string "name"
  end

  create_table "favorites", :force => true do |t|
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "favoritable_type"
    t.integer  "favoritable_id"
    t.integer  "user_id"
    t.string   "ip_address",       :default => ""
  end

  add_index "favorites", ["user_id"], :name => "fk_favorites_user"

  create_table "forums", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "topics_count",     :default => 0
    t.integer "sb_posts_count",   :default => 0
    t.integer "position"
    t.text    "description_html"
    t.string  "owner_type"
    t.integer "owner_id"
  end

  create_table "friendship_statuses", :force => true do |t|
    t.string "name"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.boolean  "initiator",            :default => false
    t.datetime "created_at"
    t.integer  "friendship_status_id"
  end

  add_index "friendships", ["friendship_status_id"], :name => "index_friendships_on_friendship_status_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "hair_colors", :force => true do |t|
    t.string "name"
  end

  create_table "homepage_features", :force => true do |t|
    t.datetime "created_at"
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.datetime "updated_at"
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.integer  "image_file_size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "image_updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.string   "email_addresses"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at"
  end

  create_table "look_fors", :force => true do |t|
    t.string "name"
  end

  create_table "matches", :force => true do |t|
    t.integer "sender_id"
    t.string  "sender_status"
    t.integer "receiver_id"
    t.string  "receiver_status"
  end

  create_table "message_threads", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "message_id"
    t.integer  "parent_message_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "parent_id"
  end

  create_table "metro_areas", :force => true do |t|
    t.string  "name"
    t.integer "state_id"
    t.integer "country_id"
    t.integer "users_count", :default => 0
  end

  create_table "moderatorships", :force => true do |t|
    t.integer "forum_id"
    t.integer "user_id"
  end

  add_index "moderatorships", ["forum_id"], :name => "index_moderatorships_on_forum_id"

  create_table "monitorships", :force => true do |t|
    t.integer "topic_id"
    t.integer "user_id"
    t.boolean "active",   :default => true
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "published_as", :limit => 16, :default => "draft"
    t.boolean  "page_public",                :default => true
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "photo_content_type"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.integer  "width"
    t.integer  "height"
    t.integer  "album_id"
    t.integer  "view_count"
    t.datetime "photo_updated_at"
  end

  add_index "photos", ["created_at"], :name => "index_photos_on_created_at"
  add_index "photos", ["parent_id"], :name => "index_photos_on_parent_id"

  create_table "polls", :force => true do |t|
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "votes_count", :default => 0
  end

  add_index "polls", ["created_at"], :name => "index_polls_on_created_at"
  add_index "polls", ["post_id"], :name => "index_polls_on_post_id"

  create_table "posts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "raw_post"
    t.text     "post"
    t.string   "title"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "view_count",                               :default => 0
    t.integer  "emailed_count",                            :default => 0
    t.integer  "favorited_count",                          :default => 0
    t.string   "published_as",               :limit => 16, :default => "draft"
    t.datetime "published_at"
    t.boolean  "send_comment_notifications",               :default => true
    t.text     "short_description"
    t.string   "locale"
    t.integer  "parent_id"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["published_as"], :name => "index_posts_on_published_as"
  add_index "posts", ["published_at"], :name => "index_posts_on_published_at"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "preferences", :force => true do |t|
    t.boolean "visible_to_others"
    t.integer "look_young_age"
    t.integer "look_old_age"
    t.integer "hide_for_younger"
    t.integer "hide_for_older"
    t.integer "height_from"
    t.integer "height_to"
    t.string  "smokes"
    t.string  "drinks"
    t.string  "body_type"
    t.integer "body_type_importance"
    t.string  "hair_color"
    t.integer "hair_color_importance"
    t.string  "ethnicity"
    t.integer "ethnicity_importance"
    t.boolean "partner_with_children"
    t.string  "look_for"
    t.string  "income"
    t.integer "income_importance"
    t.string  "countries"
    t.integer "max_distance"
    t.string  "moving"
    t.integer "user_id"
  end

  create_table "question_groups", :force => true do |t|
    t.text     "text"
    t.text     "help_text"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.string   "display_type"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "api_id"
  end

  add_index "question_groups", ["api_id"], :name => "uq_question_groups_api_id", :unique => true

  create_table "questions", :force => true do |t|
    t.integer  "survey_section_id"
    t.integer  "question_group_id"
    t.text     "text"
    t.text     "short_text"
    t.text     "help_text"
    t.string   "pick"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.string   "display_type"
    t.boolean  "is_mandatory"
    t.integer  "display_width"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "correct_answer_id"
    t.string   "api_id"
  end

  add_index "questions", ["api_id"], :name => "uq_questions_api_id", :unique => true

  create_table "relationship_statuses", :force => true do |t|
    t.string "name"
  end

  create_table "response_sets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.string   "access_code"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "api_id"
  end

  add_index "response_sets", ["access_code"], :name => "response_sets_ac_idx", :unique => true
  add_index "response_sets", ["api_id"], :name => "uq_response_sets_api_id", :unique => true

  create_table "responses", :force => true do |t|
    t.integer  "response_set_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.string   "response_group"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "survey_section_id"
    t.string   "api_id"
  end

  add_index "responses", ["api_id"], :name => "uq_responses_api_id", :unique => true
  add_index "responses", ["survey_section_id"], :name => "index_responses_on_survey_section_id"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "rsvps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "attendees_count"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sb_posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
    t.text     "body_html"
    t.string   "author_name"
    t.string   "author_email"
    t.string   "author_url"
    t.string   "author_ip"
  end

  add_index "sb_posts", ["forum_id", "created_at"], :name => "index_sb_posts_on_forum_id"
  add_index "sb_posts", ["user_id", "created_at"], :name => "index_sb_posts_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "sessid"
    t.text     "data"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "sessions", ["sessid"], :name => "index_sessions_on_sessid"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "smokes", :force => true do |t|
    t.string "name"
  end

  create_table "states", :force => true do |t|
    t.string "name"
  end

  create_table "survey_sections", :force => true do |t|
    t.integer  "survey_id"
    t.string   "title"
    t.text     "description"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.string   "custom_class"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "access_code"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.string   "css_url"
    t.string   "custom_class"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "display_order"
    t.string   "api_id"
    t.integer  "survey_version",         :default => 0
  end

  add_index "surveys", ["access_code", "survey_version"], :name => "surveys_access_code_version_idx", :unique => true
  add_index "surveys", ["api_id"], :name => "uq_surveys_api_id", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"
  add_index "taggings", ["taggable_id"], :name => "index_taggings_on_taggable_id"
  add_index "taggings", ["taggable_type"], :name => "index_taggings_on_taggable_type"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hits",           :default => 0
    t.integer  "sticky",         :default => 0
    t.integer  "sb_posts_count", :default => 0
    t.datetime "replied_at"
    t.boolean  "locked",         :default => false
    t.integer  "replied_by"
    t.integer  "last_post_id"
  end

  add_index "topics", ["forum_id", "replied_at"], :name => "index_topics_on_forum_id_and_replied_at"
  add_index "topics", ["forum_id", "sticky", "replied_at"], :name => "index_topics_on_sticky_and_replied_at"
  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"

  create_table "user_search_settings", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "show_males"
    t.boolean  "show_females"
    t.integer  "age_from"
    t.integer  "age_to"
    t.integer  "height_cm_min"
    t.integer  "height_cm_max"
    t.string   "zip"
    t.boolean  "show_only_only"
    t.string   "country_ids"
    t.string   "ward"
    t.string   "stake"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.text     "description"
    t.integer  "avatar_id"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistence_token"
    t.text     "stylesheet"
    t.integer  "view_count",                             :default => 0
    t.boolean  "vendor",                                 :default => false
    t.string   "activation_code",          :limit => 40
    t.datetime "activated_at"
    t.integer  "state_id"
    t.integer  "metro_area_id"
    t.string   "login_slug"
    t.boolean  "notify_comments",                        :default => true
    t.boolean  "notify_friend_requests",                 :default => true
    t.boolean  "notify_community_news",                  :default => true
    t.integer  "country_id"
    t.boolean  "featured_writer",                        :default => false
    t.datetime "last_login_at"
    t.string   "zip"
    t.date     "birthday"
    t.string   "gender"
    t.boolean  "profile_public",                         :default => true
    t.integer  "activities_count",                       :default => 0
    t.integer  "sb_posts_count",                         :default => 0
    t.datetime "sb_last_seen_at"
    t.integer  "role_id"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",                            :default => 0
    t.integer  "failed_login_count",                     :default => 0
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "fb_id",                    :limit => 8
    t.string   "fb_url"
    t.string   "fb_locale"
    t.string   "fb_profpic_s"
    t.string   "fb_profpic_m"
    t.string   "fb_profpic_l"
    t.string   "fb_access_token"
    t.string   "locale"
    t.text     "whatilookfor"
    t.integer  "height_cm"
    t.integer  "weight_kg"
    t.string   "body_type"
    t.string   "hair_color"
    t.string   "eye_color"
    t.boolean  "divorced"
    t.integer  "children"
    t.integer  "children_home"
    t.string   "church_attendance"
    t.string   "ward"
    t.string   "stake"
    t.boolean  "served_mission"
    t.string   "mission_location"
    t.integer  "mission_from"
    t.integer  "mission_to"
    t.string   "temple_status"
    t.string   "education"
    t.string   "education_inst"
    t.string   "ethnicity"
    t.string   "income"
    t.string   "occupation"
    t.string   "relationship_expectation"
    t.string   "relationship_status"
    t.string   "pet"
    t.string   "political_attitude"
    t.string   "travel_profile"
    t.string   "want_more_children"
    t.string   "welcome_children"
    t.string   "willing_to_move"
    t.string   "religious_attitude"
    t.string   "color_code"
  end

  add_index "users", ["activated_at"], :name => "index_users_on_activated_at"
  add_index "users", ["avatar_id"], :name => "index_users_on_avatar_id"
  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["featured_writer"], :name => "index_users_on_featured_writer"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["login_slug"], :name => "index_users_on_login_slug"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["vendor"], :name => "index_users_on_vendor"

  create_table "validation_conditions", :force => true do |t|
    t.integer  "validation_id"
    t.string   "rule_key"
    t.string   "operator"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.string   "regexp"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "validations", :force => true do |t|
    t.integer  "answer_id"
    t.string   "rule"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.integer  "choice_id"
    t.datetime "created_at"
  end

end
