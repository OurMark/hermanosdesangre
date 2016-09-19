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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160629001958) do

  create_table "Classfield_daysOfEvent", id: false, force: true do |t|
    t.integer "Classfield_classfield_id", limit: 8, null: false
    t.integer "daysOfEvent"
  end

  add_index "Classfield_daysOfEvent", ["Classfield_classfield_id"], name: "FKE372E48FC992F60B", using: :btree

  create_table "Layout", primary_key: "layout_id", force: true do |t|
    t.string "description"
  end

  create_table "OMUser_roles", id: false, force: true do |t|
    t.integer "OMUser_user_id", limit: 8, null: false
    t.string  "roles"
  end

  add_index "OMUser_roles", ["OMUser_user_id"], name: "FK12B041C7B1CCEB0", using: :btree

  create_table "OngApprovalHistory", primary_key: "history_id", force: true do |t|
    t.text    "additionalHistoryInformation", limit: 2147483647
    t.string  "endState"
    t.string  "fromState"
    t.date    "historyDate"
    t.string  "ong_name"
    t.integer "ong_id",                       limit: 8
    t.integer "processing_admin_id",          limit: 8,          null: false
  end

  add_index "OngApprovalHistory", ["processing_admin_id"], name: "FK40483D693AEDD7EE", using: :btree

  create_table "Template", primary_key: "template_id", force: true do |t|
    t.string  "state"
    t.string  "urlImage1"
    t.string  "urlImage2"
    t.string  "urlImage3"
    t.integer "layout_id", limit: 8
    t.integer "ong_id",    limit: 8
    t.integer "topic_id",  limit: 8
  end

  add_index "Template", ["layout_id"], name: "FKB515309AE61D6308", using: :btree
  add_index "Template", ["ong_id"], name: "FKB515309A35AA59EC", using: :btree
  add_index "Template", ["topic_id"], name: "FKB515309AC0F48C0C", using: :btree

  create_table "alert", primary_key: "config_id", force: true do |t|
    t.integer "alert"
    t.date    "date"
    t.integer "destinationEntityId", limit: 8
    t.integer "userToNotifyId",      limit: 8, null: false
  end

  create_table "badges", force: true do |t|
    t.string "name"
    t.string "icon"
  end

  create_table "bookings", force: true do |t|
    t.integer  "ong_id"
    t.integer  "length"
    t.string   "dni"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "start_at"
  end

  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "certificate", primary_key: "certificate_id", force: true do |t|
    t.string  "name"
    t.integer "template_id", limit: 8
  end

  add_index "certificate", ["template_id"], name: "FK745F4197C41BF588", using: :btree

  create_table "certificate_image_port", primary_key: "certificate_image_id", force: true do |t|
    t.binary  "content",        limit: 2147483647
    t.string  "type"
    t.integer "certificate_id", limit: 8
  end

  add_index "certificate_image_port", ["certificate_id"], name: "FKF9E4488D22DF858C", using: :btree

  create_table "classfield", primary_key: "classfield_id", force: true do |t|
    t.string  "adLocationType"
    t.string  "address"
    t.string  "addressState"
    t.string  "city"
    t.string  "description",    limit: 5000, null: false
    t.date    "end_date"
    t.string  "externalUrl"
    t.boolean "featured"
    t.date    "from_date"
    t.string  "subTitle"
    t.string  "title",                       null: false
    t.string  "type"
    t.string  "videoUrl"
    t.boolean "virtual"
    t.string  "zip"
    t.integer "country_id",     limit: 8
    t.integer "image_id",       limit: 8
    t.integer "location_id",    limit: 8
    t.integer "ong_id",         limit: 8,    null: false
    t.integer "topic_id",       limit: 8
  end

  add_index "classfield", ["country_id"], name: "FKEF102282C81ABA2C", using: :btree
  add_index "classfield", ["image_id"], name: "FKEF1022826D5C60E9", using: :btree
  add_index "classfield", ["location_id"], name: "FKEF1022823BA1E7A8", using: :btree
  add_index "classfield", ["ong_id"], name: "FKEF10228235AA59EC", using: :btree
  add_index "classfield", ["topic_id"], name: "FKEF102282C0F48C0C", using: :btree

  create_table "code_label_value", id: false, force: true do |t|
    t.integer "code_id",  limit: 8, null: false
    t.integer "value_id", limit: 8, null: false
  end

  add_index "code_label_value", ["code_id"], name: "FK790EFD1464F9DA8", using: :btree
  add_index "code_label_value", ["value_id"], name: "FK790EFD1433153C14", using: :btree

  create_table "config", primary_key: "config_id", force: true do |t|
    t.string  "certificatesPrivacy"
    t.string  "emailSendingConfig"
    t.string  "nick"
    t.string  "profilePrivacyLevel"
    t.binary  "useNick",             limit: 1
    t.integer "user_id",             limit: 8, null: false
  end

  add_index "config", ["nick"], name: "nick", unique: true, using: :btree
  add_index "config", ["user_id"], name: "FKAF3F834233390646", using: :btree

  create_table "country", primary_key: "country_id", force: true do |t|
    t.string "code"
    t.string "name"
  end

  add_index "country", ["code"], name: "code", unique: true, using: :btree

  create_table "deed_code", primary_key: "code_id", force: true do |t|
    t.date    "expiration_date"
    t.string  "name"
    t.string  "peridiocity"
    t.integer "quantity",        limit: 8
    t.string  "status"
    t.string  "token"
    t.string  "type"
    t.date    "valid_from"
    t.integer "ong_id",          limit: 8, null: false
    t.integer "topic_id",        limit: 8, null: false
  end

  add_index "deed_code", ["ong_id"], name: "FK757575EC35AA59EC", using: :btree
  add_index "deed_code", ["token"], name: "token", unique: true, using: :btree
  add_index "deed_code", ["topic_id"], name: "FK757575ECC0F48C0C", using: :btree

  create_table "deed_label_value", id: false, force: true do |t|
    t.integer "good_deed_id", limit: 8, null: false
    t.integer "value_id",     limit: 8, null: false
  end

  add_index "deed_label_value", ["good_deed_id"], name: "FKCB6977878EABBCA3", using: :btree
  add_index "deed_label_value", ["value_id"], name: "FKCB69778733153C14", using: :btree

  create_table "email", primary_key: "email_id", force: true do |t|
    t.string "address"
    t.binary "confirmed", limit: 1
  end

  add_index "email", ["address"], name: "address", unique: true, using: :btree

  create_table "entity_image", primary_key: "entity_image_id", force: true do |t|
    t.binary "content", limit: 2147483647
  end

  create_table "exchanged_code", primary_key: "exchange_id", force: true do |t|
    t.date    "exchange_date"
    t.string  "feedback"
    t.integer "code_id",       limit: 8, null: false
    t.integer "user_id",       limit: 8, null: false
  end

  add_index "exchanged_code", ["code_id"], name: "FK3F2CCB64F9DA8", using: :btree
  add_index "exchanged_code", ["user_id"], name: "FK3F2CCB33390646", using: :btree

  create_table "external_tag", force: true do |t|
    t.string  "externalId"
    t.string  "name"
    t.string  "source"
    t.integer "topic_id",   limit: 8, null: false
  end

  add_index "external_tag", ["topic_id"], name: "FKAD697526C0F48C0C", using: :btree

  create_table "file_content", primary_key: "content_id", force: true do |t|
    t.binary "content", limit: 2147483647
  end

  create_table "good_deed", primary_key: "good_deed_id", force: true do |t|
    t.string  "authorizerComments"
    t.string  "comments",                   limit: 5000
    t.date    "fromDate",                                null: false
    t.string  "integrationId"
    t.integer "marksGiven",                 limit: 8
    t.string  "name"
    t.integer "quantity",                   limit: 8
    t.string  "state"
    t.date    "toDate"
    t.binary  "visible",                    limit: 1
    t.integer "certificate_certificate_id", limit: 8
    t.integer "ong_id",                     limit: 8,    null: false
    t.integer "topic_id",                   limit: 8,    null: false
  end

  add_index "good_deed", ["certificate_certificate_id"], name: "FK520D2322F36C7134", using: :btree
  add_index "good_deed", ["integrationId"], name: "integrationId", unique: true, using: :btree
  add_index "good_deed", ["ong_id"], name: "FK520D232235AA59EC", using: :btree
  add_index "good_deed", ["topic_id"], name: "FK520D2322C0F48C0C", using: :btree

  create_table "label", force: true do |t|
    t.string  "name"
    t.integer "ong_id", limit: 8, null: false
  end

  add_index "label", ["ong_id"], name: "FK61F7EF435AA59EC", using: :btree

  create_table "label_value", force: true do |t|
    t.string  "value"
    t.integer "label_id", limit: 8, null: false
  end

  add_index "label_value", ["label_id"], name: "FK18426C6684C479EC", using: :btree

  create_table "location", primary_key: "location_id", force: true do |t|
    t.string  "formatted_address"
    t.decimal "lat",               precision: 12, scale: 9, null: false
    t.decimal "lon",               precision: 12, scale: 9, null: false
    t.string  "type",                                       null: false
  end

  create_table "ong", primary_key: "ong_id", force: true do |t|
    t.string  "additionalInfo",           limit: 5000
    t.string  "address"
    t.string  "address2"
    t.string  "addressState"
    t.string  "adminEmail"
    t.string  "adminName"
    t.string  "adminSurname"
    t.string  "apiKey"
    t.string  "city"
    t.string  "contactEmail"
    t.string  "contactPerson"
    t.string  "contactPersonEmail"
    t.text    "description",              limit: 2147483647
    t.string  "facebookPage"
    t.binary  "hasImage",                 limit: 1,          null: false
    t.string  "integrationBaseURL"
    t.string  "internationalNetworkName"
    t.string  "lang"
    t.float   "latitude",                 limit: 53
    t.string  "linkedin"
    t.float   "longitude",                limit: 53
    t.string  "name",                                        null: false
    t.string  "nationalNetworkName"
    t.string  "phone"
    t.string  "privateKey"
    t.integer "sessionExpirationDate",    limit: 8
    t.string  "sessionToken"
    t.string  "state"
    t.string  "twitter"
    t.string  "type"
    t.string  "websiteUrl"
    t.string  "zip"
    t.integer "country_id",               limit: 8
    t.integer "image_id",                 limit: 8
    t.integer "location_id",              limit: 8
  end

  add_index "ong", ["country_id"], name: "FK1AE68C81ABA2C", using: :btree
  add_index "ong", ["image_id"], name: "FK1AE686D5C60E9", using: :btree
  add_index "ong", ["location_id"], name: "FK1AE683BA1E7A8", using: :btree
  add_index "ong", ["name"], name: "name", unique: true, using: :btree

  create_table "ong_admins", id: false, force: true do |t|
    t.integer "ong_ong_id",     limit: 8, null: false
    t.integer "admins_user_id", limit: 8, null: false
  end

  add_index "ong_admins", ["admins_user_id"], name: "FKB98330BB6ABDD00B", using: :btree
  add_index "ong_admins", ["ong_ong_id"], name: "FKB98330BB43F323A3", using: :btree

  create_table "ong_calendars", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.time     "start_time_differential"
    t.time     "end_time_differental"
    t.string   "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ong_id"
  end

  create_table "ong_details", force: true do |t|
    t.integer "ong_id"
    t.integer "beds"
    t.integer "timelapse"
  end

  create_table "ong_topic", id: false, force: true do |t|
    t.integer "ong_id",   limit: 8, null: false
    t.integer "topic_id", limit: 8, null: false
  end

  add_index "ong_topic", ["ong_id"], name: "FKDDC2709835AA59EC", using: :btree
  add_index "ong_topic", ["topic_id"], name: "FKDDC27098C0F48C0C", using: :btree

  create_table "template_element", primary_key: "template_element_id", force: true do |t|
    t.string  "extension"
    t.integer "size",                limit: 8
    t.string  "type"
    t.integer "template_id",         limit: 8
    t.integer "template_content_id", limit: 8
  end

  add_index "template_element", ["template_content_id"], name: "FK31BE7837F143CA0B", using: :btree
  add_index "template_element", ["template_id"], name: "FK31BE7837C41BF588", using: :btree

  create_table "topic", primary_key: "topic_id", force: true do |t|
    t.string "description"
    t.string "name"
    t.string "topicImage"
  end

  add_index "topic", ["name"], name: "topic_name", using: :btree

  create_table "topic_converter", primary_key: "topic_converter_id", force: true do |t|
    t.float   "marksPerUnit", limit: 53
    t.integer "topic_id",     limit: 8,  null: false
  end

  add_index "topic_converter", ["topic_id"], name: "FK4E9FE290C0F48C0C", using: :btree
  add_index "topic_converter", ["topic_id"], name: "topic_id", unique: true, using: :btree

  create_table "user", primary_key: "user_id", force: true do |t|
    t.string   "activationToken"
    t.datetime "birthDate"
    t.boolean  "blocked"
    t.string   "facebookToken"
    t.string   "gender"
    t.date     "lastLogin"
    t.string   "name"
    t.string   "encrypted_password"
    t.integer  "points",                 limit: 8
    t.string   "sessionToken"
    t.string   "surname"
    t.string   "twitterToken"
    t.string   "twitterTokenSecret"
    t.string   "username"
    t.integer  "version",                limit: 8
    t.integer  "image_id",               limit: 8
    t.integer  "location_id",            limit: 8
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.string   "reset_password_sent_at"
  end

  add_index "user", ["image_id"], name: "FK36EBCB6D5C60E9", using: :btree
  add_index "user", ["location_id"], name: "FK36EBCB3BA1E7A8", using: :btree
  add_index "user", ["username"], name: "username", unique: true, using: :btree

  create_table "user_badges", force: true do |t|
    t.integer "user_id"
    t.integer "badge_id"
  end

  add_index "user_badges", ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
  add_index "user_badges", ["user_id"], name: "index_user_badges_on_user_id", using: :btree

  create_table "user_details", force: true do |t|
    t.integer "user_id"
    t.string  "dni"
    t.string  "bloodtype"
  end

  create_table "user_email", id: false, force: true do |t|
    t.integer "user_user_id",    limit: 8, null: false
    t.integer "emails_email_id", limit: 8, null: false
  end

  add_index "user_email", ["emails_email_id"], name: "FK728A5628DFEDD3D4", using: :btree
  add_index "user_email", ["emails_email_id"], name: "emails_email_id", unique: true, using: :btree
  add_index "user_email", ["user_user_id"], name: "FK728A56288E289DD2", using: :btree

  create_table "user_good_deed", primary_key: "good_deed_id", force: true do |t|
    t.integer "claimer_user_id", limit: 8, null: false
  end

  add_index "user_good_deed", ["claimer_user_id"], name: "FKAF7507AE1D8949F0", using: :btree
  add_index "user_good_deed", ["good_deed_id"], name: "FKAF7507AE8EABBCA3", using: :btree

  create_table "user_locale", primary_key: "user_locale_id", force: true do |t|
    t.string  "country"
    t.string  "lang"
    t.integer "user_id", limit: 8
    t.string  "city"
    t.string  "state"
  end

  add_index "user_locale", ["user_id"], name: "FKEACF554E33390646", using: :btree

end
