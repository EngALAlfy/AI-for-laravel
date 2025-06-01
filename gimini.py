import requests
import json
import os

API_KEY = os.getenv('GEMINI_API_KEY')
if not API_KEY:
    raise ValueError("Please set the GEMINI_API_KEY environment variable")

API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key={API_KEY}"

# إعدادات التوليد + نوع البيانات المطلوبة
generation_config = {
    "temperature": 0.2,
    "topP": 0.8,
    "topK": 40,
    "maxOutputTokens": 512,
    "candidateCount": 1,
    "responseMimeType": "application/json",
    "responseSchema": {
        "type": "OBJECT",
        "properties": {
            "sql": { "type": "STRING" }
        },
        "required": ["sql"]
    }
}

# إدخال السؤال من المستخدم
user_question = input("❓ Write your report in English: ").strip()

# إعداد الـ prompt
prompt_text = (
    "You are a SQL assistant. Database type: MySQL.\n"
    "Respond with ONLY a single valid SQL SELECT query inside a JSON object.\n"
    "Do NOT include any DELETE, UPDATE, INSERT, DROP, or dangerous operations.\n"
    "The query must match the given schema, and be safe to run.\n\n"
    "Database schema:\n"
    "Table: areas (id, name, city_id, created_at, updated_at)\n\n"
    """
    Table: assist_drivers (id, note, is_arrived, order_id, driver_id, created_at, updated_at)
Table: audience_coupon_user (id, coupon_id, user_id, created_at, updated_at)
Table: balances (id, user_id, balance, spent, created_at, updated_at, suspended, suspended_at, suspended_by)
Table: balance_transactions (id, user_id, balance_id, order_id, depit, credit, balance, statement, sender_id, receiver_id, processing, created_by, created_at, updated_at)
Table: blog_categories (id, name, created_at, updated_at, deleted_at)
Table: bookings (id, user_id, branch_id, restaurant_id, status_id, number_of_persons, place, date, time, app_amount, note, cancellation_reason, rating_note, created_at, updated_at, icame, rating)
Table: bookings_earnings_per_day (booking_id, branch_id, restaurant_id, day, status_id, total)
Table: booking_inactive_times (id, branch_id, time, created_at, updated_at)
Table: booking_status (id, status, created_at, updated_at)
Table: bookmarks (id, user_id, bookmark_type, bookmark_id)
Table: branches (id, restaurant_id, name, description, zone_id, city_id, address, latitude, longitude, phone, mobile, branch_status_id, delivery_rush_delay, active, created_at, updated_at, code, deleted_at, is_central, restaurant_inactive_reason_id, inactive_note)
Table: branch_rush_days (id, branch_id, date, created_at, updated_at)
Table: branch_sessions (id, branch_id, restaurant_id, day, start_at, end_at, status_id, force, status_reason_id, by, note)
Table: branch_statistics (id, branch_id, restaurant_id, avg_online, avg_busy, avg_offline, created_at, updated_at)
Table: branch_statistics_per_day (branch_id, restaurant_id, day, status_id, avg_time)
Table: camera_requests (id, driver_id, day, driver_captured_image_id, title, message, action, should_fire_alarm, created_at, updated_at)
Table: cancellation_reasons (id, name, created_at, updated_at, restaurant_cost_percentage, app_cost_percentage, has_note)
Table: cancellation_reason_role (id, cancellation_reason_id, role_id, created_at, updated_at)
Table: captain_providers (id, user_id, code, office_address, created_at, updated_at, deleted_at)
Table: captain_provider_zones (id, captain_provider_id, city_id, zone_id)
Table: career_faqs (id, title, content, created_at, updated_at)
Table: career_positions (id, title, subtitle, form_link, created_at, updated_at)
Table: career_sliders (id, title, subtitle, description, created_at, updated_at)
Table: career_teams (id, title, description, created_at, updated_at)
Table: career_videos (id, video_url, description, created_at, updated_at)
Table: carts (id, branch_id, restaurant_id, user_id, order_id, created_at, updated_at)
Table: cart_foods (id, cart_id, food_id, quantity, size_id, extras, preferences, created_at, updated_at)
Table: categories (id, name, sort, description, restaurant_id, cuisine_id, created_at, updated_at, deleted_at, sector_id)
Table: cities (id, name, deleted_at)
Table: clubs (id, user_id, status, join_at, expires_at, expired_at, created_at, updated_at)
Table: collection_banners (id, name, is_items, created_at, updated_at)
Table: collection_banner_items (id, collection_banner_id, target_type, target_id, created_at, updated_at)
Table: compensation (id, name, value, created_at, updated_at)
Table: compensation_conditions (id, role_id, limit, created_at, updated_at)
Table: compensation_role (id, compensation_id, role_id, created_at, updated_at)
Table: complaints (id, title, type, category, description, agent_id, customer_id, email, target_type, target_id, branch_id, restaurant_id, status, submission_date, close_date, deleted_at, created_at, updated_at, department)
Table: complaint_actions (id, action, complaint_id, agent_id, created_at, updated_at)
Table: constrained_order_confirmation (order_id, level, approved, paid_online, trusted, deposit_status, deposit_accepted_at, deposit_received, deposit_percentage, deposit_value, created_at, updated_at)
Table: contact_person (id, name, phone, position, model_type, model_id, created_at, updated_at)
Table: conversations (id, conversationable_type, conversationable_id)
Table: coupons (id, code, user_id, discount, discount_type, discount_max, coupon_condition, description, expires_at, starts_at, enabled, showable, club, audience, zone_groups, created_by, app_coupon, campaign, multiple_use, created_at, updated_at, deleted_at, max_users, archived_at, first_order)
Table: coupon_campaign_targets (id, coupon_id, code, user_id, created_at, updated_at, deleted_at)
Table: coupon_requests (id, code, user_id, discount, discount_type, discount_max, description, expires_at, starts_at, restaurant_id, foods, enabled, coupon_condition, created_by, approved_by_user_id, showable, club, audience, zone_groups, approved, max_users, multiple_use, created_at, updated_at)
Table: coupon_times (id, coupon_id, day, from, to, created_at, updated_at)
Table: cuisines (id, photo, name, description, created_at, updated_at, deleted_at, is_primary)
Table: currencies (id, name, symbol, code, decimal_digits, rounding, created_at, updated_at)
Table: deep_link_short_codes (id, short_code, target_url, meta, created_at, updated_at)
Table: delivery_addresses (id, description, address, building, floor, apartment, phone, latitude, longitude, is_default, type, user_id, zone_id, created_at, updated_at, deleted_at)
Table: delivery_vehicles (id, name, type, created_at, updated_at)
Table: discountables (id, coupon_id, discountable_type, discountable_id)
Table: dispatching (id, note, is_received, order_id, driver_id, received_from_driver_id, created_at, updated_at)
Table: drivers (id, user_id, age, address, latitude, longitude, available, condition, condition_note, national_id_number, created_at, updated_at, deleted_at, wallet_number, national_id_expiration, driving_license_number, driving_license_expiration, delivery_vehicle_id, plate_number, captain_provider_id)
Table: drivers_fee (id, fee_percentage, fee_fixed, ragion)
Table: drivers_payouts (id, driver_id, accounting_date, method, amount, doc_id, note, created_at, updated_at)
Table: driver_arrivals (id, order_id, driver_id, client_arrival, store_arrival, created_at, updated_at)
Table: driver_assist_earnings_per_day (driver_id, day, order_id, status_id, captain, order_delivery, payment_status, payment_method)
Table: driver_captured_images (id, driver_id, ip_address, mac_address, os, brand, version_name, version_number, lag, lat, session_id, created_at, updated_at)
Table: driver_cash_requests (id, amount, driver_id, order_id, status, reason, note, status_by_id, created_at, updated_at)
Table: driver_day_offs (id, day_of_week, driver_id, created_at, updated_at)
Table: driver_earnings_per_day (driver_id, day, order_id, status_id, captain, order_delivery, payment_total, payment_status, payment_method, captain_get)
Table: driver_finished_orders_per_day (driver_id, day, order_count, accepttime, deliverytime, speed)
Table: driver_live_location_histories (id, driver_name, driver_id, user_status_id, latitude, longitude, orders, time, date, created_at, updated_at)
Table: driver_lost_work_time_per_day (driver_id, day, duration_in_seconds)
Table: driver_order_notification (id, order_id, driver_id, active, late_time, created_at, updated_at)
Table: driver_penalties (id, title, value, week_start, driver_id, created_by_user_id, created_at, updated_at)
Table: driver_rate (driver_id, rate)
Table: driver_real_work_time_per_day (driver_id, day, duration_in_seconds)
Table: driver_requests (id, name, email, age, captain_provider_id, address, phone_number, phone_number_alt, city_id, zone_id, preferred_work_time, note, status, viewed_at, created_at, updated_at, wallet_number, delivery_vehicle_id, plate_number)
Table: driver_reviews (id, review, rate, user_id, publish, driver_id, created_at, updated_at, order_id)
Table: driver_sessions (id, driver_id, day, start_at, end_at, status_id, shift, ip_address, mac_address, os, brand, version_name, version_number, lag, lat, options)
Table: driver_shifts (id, title, start_time, end_time, enabled, created_at, updated_at)
Table: driver_shift_user (id, driver_id, driver_shift_id, created_at, updated_at)
Table: driver_statistics (id, driver_id, total_orders, m_worked_days, m_worked_hours, worked_days, worked_hours, real_time_work, lost_time, response_time, overall_distance, created_at, updated_at)
Table: driver_worked_hours_per_day (driver_id, day, duration_in_seconds)
Table: driver_zones (id, driver_id, city_id, zone_id)
Table: email_verify_tokens (id, user_id, token, created_at, updated_at)
Table: employee_wallets (id, active, auto_charge, auto_charge_value, user_id, created_at, updated_at)
Table: employee_wallet_transactions (id, amount, auto_charge, statement, employee_wallet_id, order_id, user_id, created_at, updated_at)
Table: empty_extras_branches (branch_id, extra_id)
Table: empty_preferences_branches (branch_id, preference_id)
Table: empty_sizes_branches (branch_id, size_id)
Table: empty_stock_branches (branch_id, food_id, created_by)
Table: evaluations (id, zone_id, driver_id, restaurant_id, created_by_user_id, restaurant_employee_name, restaurant_employee_job, restaurant_employee_phone, rate, training_reason, type_of_violation, notes, type, created_at, updated_at)
Table: explore_menu (id, title, active, sector_id, from, to, order, created_at, updated_at)
Table: extras (id, photo, name, description, price, extra_group_id, restaurant_id, created_at, updated_at, deleted_at, status)
Table: extra_food (food_id, extra_id, active)
Table: extra_groups (id, photo, name, description, restaurant_id, force, max, created_at, updated_at, deleted_at)
Table: extra_size (extra_id, size_id)
Table: failed_jobs (id, uuid, connection, queue, payload, exception, failed_at)
Table: faqs (id, question, answer, faq_category_id, created_at, updated_at)
Table: faq_categories (id, name, created_at, updated_at)
Table: faq_roles (faq_id, role_id)
Table: favorites (id, food_id, user_id, created_at, updated_at)
Table: favorite_extras (extra_id, favorite_id)
Table: first_time_passwords (id, user_id, token, created_at, updated_at)
Table: foods (id, photo, name, price, discount_price, app_discount_price, store_discount_price, preparing_time, description, ingredients, package_items_count, weight, unit, featured, deliverable, hidden, active, restaurant_id, category_id, created_at, updated_at, status, is_archived, menu_id, deleted_at, disable_discounts, disable_coupon_discount, disable_wallet_discount, disable_pickup_discount, max_choice)
Table: food_offer_condition (id, offer_condition_id, food_id, price)
Table: food_orders (id, price, app_discount_price, store_discount_price, quantity, food_id, order_id, size_id, extras, preferences, total, created_at, updated_at)
Table: food_orders_history (id, price, app_discount_price, store_discount_price, quantity, food_order_id, food_id, order_id, size_id, extras, preferences, total, created_at, updated_at)
Table: food_preferences (food_id, preferences_id, active)
Table: food_rate (food_id, rate, total)
Table: food_reviews (id, review, rate, user_id, food_id, restaurant_id, publish, created_at, updated_at, order_id)
Table: food_types (type_id, food_id)
Table: galleries (id, description, primary_image, restaurant_id, created_at, updated_at)
Table: google_directions_distances (id, origin, destination, distance, expires_at, created_at, updated_at)
Table: happy_hours (id, coupon_id, from_time, to_time, from_date, to_date, is_single, type, title, body, created_at, updated_at)
Table: happy_hour_restaurant (id, restaurant_id, happy_hours_id, created_at, updated_at)
Table: ha_translations (id, language, group, key, value, created_at, updated_at)
Table: hot_offers (id, price, food_id, status, deleted_at, created_at, updated_at)
Table: invoices (id, invoice_number, invoice_date, restaurant_id, start_date, end_date, total_orders, cancelled_orders, total_value, system_due, system_vouchers, store_vouchers, store_due, cancellation_adjustments, cancellation_50_50, cash_payments, previous_balance, created_at, updated_at, deleted_at)
Table: in_app_messages (id, title, message, action, should_fire_alarm, notifiable_type, notifiable_id, created_at, updated_at)
Table: jobs (id, queue, payload, attempts, reserved_at, available_at, created_at)
Table: media (id, model_type, model_id, uuid, collection_name, name, file_name, mime_type, disk, conversions_disk, size, manipulations, custom_properties, generated_conversions, responsive_images, order_column, created_at, updated_at)
Table: menus (id, name, start_at, end_at, created_at, updated_at)
Table: menu_builders (id, title, route, url, url_param, segments, excluded_segments, permissions, icon, created_at, updated_at)
Table: menu_builder_roles (id, menu_builder_id, parent_id, role_id, order, visible, created_at, updated_at)
Table: messages (id, conversation_id, sender_id, receiver_id, message, read, created_at, updated_at)
Table: migrations (id, migration, batch)
Table: mobile_widgets (id, name, type, widget_id, data, children, is_active, order, image, created_at, updated_at)
Table: model_do_not_has_permissions (permission_id, model_type, model_id)
Table: model_has_permissions (permission_id, model_type, model_id)
Table: model_has_roles (role_id, model_type, model_id)
Table: notes (id, notable_type, notable_id, note, created_at, updated_at, created_by_user_id)
Table: notifications (id, notification_type_id, notification_type_options, topic, type, is_text, active, caption, bannertype, section, store, nav_route, nav_param, navstore, navfood, notifiable_type, notifiable_id, data, created_at, updated_at, notification_times_active)
Table: notification_seen (id, user_id, notification_id, created_at, updated_at)
Table: notification_sents (id, created_by_user_id, notification_id, snapshot_data, created_at, updated_at)
Table: notification_sent_user (id, user_id, notification_sent_id, created_at, updated_at)
Table: notification_times (id, day, notification_id, time, created_at, updated_at)
Table: notification_types (id, name, type)
Table: notification_type_options (id, notification_id, key, addition, value, created_at, updated_at)
Table: nutrition (id, name, quantity, food_id, restaurant_id, active, created_at, updated_at, deleted_at)
Table: offers (id, slug, title, description, title_color, description_color, title_color_light, description_color_light, image_color, image_color_light, background_color, background_color_light, image_position, enabled, mode, nav_route, nav_param, icon, is_guest, created_at, updated_at)
Table: offer_conditions (id, name, min_item, min_cart, created_at, updated_at, deleted_at)
Table: orders (id, code, confirm_code, user_id, cancelled_by, order_status_id, branch_id, restaurant_id, app_deliver, pickup, tax, delivery_fee, driver_fee, hint, active, driver_id, coupon_id, wallet_pay, has_item_with_discount, has_hot_offer, has_conditional_offers, wallet_transaction_id, compensation_transaction_id, compensation_coupon_id, accept_at, finished_at, rejected_at, preparing_time, delivery_address_id, order_delivery_address_id, order_delivery_fee_calculations_id, latitude, longitude, approximate_distance, customer_distance, store_distance, processing, app_commission, commission_includes_tax, commission_tax, commission_with_tax, created_at, updated_at, cancellation_reason_id, cancellation_reason_note, app_cancellation_fees, store_cancellation_fees, app_cancellation_percentage, store_cancellation_percentage, returned_to_store, returned_to_store_at, assigned_to_user_id, assigned_how_user_id, mco, pre_order_at, is_restaurant_partner, service_fee, edit_auth, pay_on_spot, toggle_rate, was_ready)
Table: order_delivery_address (id, description, address, latitude, longitude, building, floor, apartment, type, phone, user_id, zone_id, created_at, updated_at)
Table: order_delivery_fee_calculations (id, initial_km_distance, initial_km_fees, additional_km_fees, order_additional_distance, order_initial_distance, order_delivery_fee, delivery_fee_calculation, partner, delivery_vehicle_id, zone_id, is_free, created_at, updated_at, order_distance)
Table: order_discounts (id, order_id, value, app_percentage, store_percentage, type, created_at, updated_at)
Table: order_earnings_per_day (order_id, branch_id, restaurant_id, day, status_id, total, app, app_commission_tax, store, service_fee, app_food_discounts, total_discounts, app_discounts, store_discounts, delivery_fee, app_delivery_fee, store_delivery_fee, app_cancellation_fees, store_cancellation_fees, is_cancel_50_50)
Table: order_history (id, order_id, user_id, cancelled_by, order_status_id, branch_id, restaurant_id, app_deliver, pickup, tax, delivery_fee, driver_fee, hint, active, driver_id, coupon_id, wallet_pay, has_item_with_discount, has_hot_offer, has_conditional_offers, wallet_transaction_id, compensation_transaction_id, accept_at, finished_at, rejected_at, preparing_time, delivery_address_id, order_delivery_address_id, order_delivery_fee_calculations_id, latitude, longitude, approximate_distance, customer_distance, store_distance, processing, app_commission, commission_includes_tax, commission_tax, commission_with_tax, cancellation_reason_id, cancellation_reason_note, app_cancellation_fees, store_cancellation_fees, returned_to_store, returned_to_store_at, assigned_to_user_id, assigned_how_user_id, mco, pre_order_at, is_restaurant_partner, service_fee, created_at, updated_at, pay_on_spot)
Table: order_info (id, order_id, driver_rate, driver_fee, driver_fee_type, pickup_discount_percentage, pickup_discount_limit, created_at, updated_at, driver_collected, driver_paid)
Table: order_log (id, order_id, time, status_id, title, created_by_user_id, driver_lat, driver_lag)
Table: order_rejections (order_id, cancellation_reason_note, cancellation_reason_id, rejected_by, confirmed_by, rejected_at, confirmed_at, is_confirmed, created_at, updated_at)
Table: order_statuses (id, status, created_at, updated_at)
Table: order_update_infos (id, total, collected_from_client, accept_discounts, order_id, created_by_user_id, created_at, updated_at, support_online_payment)
Table: otps (id, identifier, token, validity, expired, no_times_generated, no_times_attempted, generated_at, created_at, updated_at)
Table: packages (id, name, description, created_at, updated_at)
Table: packages_log (id, restaurant_id, package_id, subscription_start_at, subscription_end_at, fee, duration, payment_method, document_id, end_at, end_by, end_reason)
Table: package_fees (id, package_id, fee, duration, created_at, updated_at)
Table: password_resets (email, token, created_at)
Table: payments (id, payment_reference, price, description, user_id, status, method, gateway, transaction_id, created_at, updated_at, payable_type, payable_id, paid_amount, remaining_amount)
Table: payment_details (id, payment_id, description, response, created_at, updated_at)
Table: payment_log (id, payment_id, status, time)
Table: pending_orders (id, user_id, cancelled_by, order_status_id, branch_id, restaurant_id, app_deliver, pickup, tax, delivery_fee, driver_fee, hint, active, driver_id, coupon_id, wallet_pay, has_item_with_discount, has_hot_offer, has_conditional_offers, wallet_transaction_id, compensation_transaction_id, accept_at, finished_at, rejected_at, preparing_time, delivery_address_id, order_delivery_address_id, order_delivery_fee_calculations_id, latitude, longitude, approximate_distance, customer_distance, store_distance, processing, app_commission, commission_includes_tax, commission_tax, commission_with_tax, cancellation_reason_id, cancellation_reason_note, app_cancellation_fees, store_cancellation_fees, returned_to_store, returned_to_store_at, assigned_to_user_id, assigned_how_user_id, mco, pre_order_at, is_restaurant_partner, service_fee, created_at, updated_at, pay_on_spot)
Table: pending_order_discounts (id, pending_order_id, value, app_percentage, store_percentage, type, created_at, updated_at)
Table: pending_order_foods (id, price, app_discount_price, store_discount_price, quantity, food_id, pending_order_id, size_id, extras, preferences, total, created_at, updated_at)
Table: permissions (id, name, guard_name, description, group_id, created_at, updated_at, deleted_at)
Table: permission_group (id, name)
Table: personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at)
Table: phone_verify_logs (id, phone, verified_at, user_id, created_at, updated_at)
Table: photos (id, user_id, created_at, updated_at)
Table: policies (id, question, answer, created_at, updated_at)
Table: policy_roles (policy_id, role_id)
Table: popups (id, name, active, section_id, restaurant_id, food_id, type, created_at, updated_at)
Table: posts (id, title, summary, content, tags, owner, read_count, created_at, updated_at, deleted_at)
Table: preferences (id, photo, name, preferences_group_id, restaurant_id, created_at, updated_at, deleted_at, status)
Table: preferences_group (id, photo, name, description, restaurant_id, multiple, created_at, updated_at, deleted_at, force, max)
Table: preferences_size (preferences_id, size_id)
Table: preferred_sections (id, name, active, created_at, updated_at)
Table: ragions (id, sort, ragion)
Table: referrals (id, user_id, code, created_at, updated_at)
Table: referral_users (id, referral_id, user_id, coupon_id, created_at, updated_at)
Table: reset_code_passwords (id, email, code, created_at, updated_at)
Table: restaurants (id, restaurant_group_id, photo, name, description, special_offer, classification, contact_name, contact_email, contact_phone, admin_commission, delivery_fee, delivery_range, default_tax, default_delivery_time_from, default_delivery_time_to, default_preparing_time, max_preparing_time, restaurant_status_id, sector_id, free_delivery, vip, outdoor, partner, active, available_for_delivery, created_at, updated_at, update_status_automatically, tax_card_number, commercial_registration_number, owner_name, owner_id, deleted_at, app_booking_fee, support_online_payment, accept_discounts, order_limit_value, have_offers, have_discounts, is_terminated, is_featured, is_breakfast, bank_account_owner_name, bank_account_number, bank_name, owner_wallet_number, enable_custom_delivery_fee, pay_on_spot, custom_delivery_range, disable_pickup, commission_includes_tax, restaurant_inactive_reason_id, registered_at, payout_duration, first_time_active, first_time_set_partner, last_time_terminated, who_terminated_user_id, inactive_note)
Table: restaurants_payouts (id, restaurant_id, accounting_date, method, amount, doc_id, note, created_at, updated_at)
Table: restaurant_conversations (id, restaurant_id, user_id, active, created_at, updated_at)
Table: restaurant_cuisines (cuisine_id, restaurant_id)
Table: restaurant_custom_delivery_fees (id, initial_km_distance, initial_km_fees, additional_km_fees, is_free, restaurant_id, delivery_vehicle_id, zone_id, created_at, updated_at)
Table: restaurant_excluded_zones (id, restaurant_id, zone_id)
Table: restaurant_groups (id, name, active, created_at, updated_at)
Table: restaurant_inactive_reasons (id, reason, created_at, updated_at)
Table: restaurant_requests (id, name, email, phone_number, branch_address, store_name, city_id, zone_id, sector_id, num_of_branches, note, status, viewed_at, user_id, created_at, updated_at)
Table: restaurant_reviews (id, review, rate, user_id, restaurant_id, publish, created_at, updated_at, order_id)
Table: restaurant_sector (id, sector_id, restaurant_id, created_at, updated_at)
Table: restaurant_slides (id, indicator_color, image_fit, food_id, restaurant_id, enabled, created_at, updated_at)
Table: restaurant_status (id, status, created_at, updated_at)
Table: restaurant_types (type_id, restaurant_id)
Table: restaurant_zone_delivery_fees (id, restaurant_id, zone_id, delivery_fee, created_at, updated_at)
Table: roles (id, name, guard_name, default, level, restricted_zones, vendor_restriction, created_at, updated_at, deleted_at)
Table: role_has_permissions (permission_id, role_id)
Table: sectors (id, name, description, is_banner, created_at, updated_at)
Table: sizes (id, photo, price, discount_price, app_discount_price, store_discount_price, food_id, size_group_id, restaurant_id, active, created_at, updated_at, deleted_at, status)
Table: size_group (id, photo, name, description, restaurant_id, created_at, updated_at, deleted_at)
Table: status_reasons (id, name, created_at, updated_at, type)
Table: teams (id, name, description)
Table: term_roles (term_id, role_id)
Table: total_zones (id, polygon, created_at, updated_at)
Table: types (id, name, description, created_at, updated_at, deleted_at)
Table: uploads (id, uuid, created_at, updated_at)
Table: users (id, photo, can_booking, missed_booking_count, suspended, suspension_reason, name, email, phone, phone_alt, email_verified_at, password, bio, own_payment, user_status_id, device_token, card_brand, card_last_four, card_token, remember_token, keepalive, is_alive, jwt_token, fb_id, google_id, apple_id, two_factor_code, two_factor_expires_at, blocked_at, archived_at, archived_by, created_at, updated_at, deleted_at, suspended_at, suspended_by, order_rate_attempts, is_employee, force_password)
Table: user_branches (user_id, branch_id, id)
Table: user_cities (user_id, city_id)
Table: user_coupons (user_id, coupon_id, created_at, updated_at)
Table: user_restaurants (user_id, restaurant_id)
Table: user_restaurant_groups (user_id, restaurant_group_id)
Table: user_status (id, status, created_at, updated_at)
Table: user_vendors (user_id, restaurant_id)
Table: user_zones (user_id, zone_id)
Table: visits (id, user_id, model_type, model_id, visited_at)
Table: wallets (id, user_id, balance, spent, last_use, created_at, updated_at)
Table: wallet_transactions (id, user_id, wallet_id, depit, credit, balance, statement, created_by, created_at, updated_at)
Table: zones (id, city_id, name, polygon, show_in_global_zone, deleted_at, area_id)
    """
    f"Question: {user_question}"
)

# إعداد البيانات
data = {
    "contents": [
        {
            "parts": [{"text": prompt_text}]
        }
    ],
    "generationConfig": generation_config
}

# إرسال الطلب
response = requests.post(
    API_URL,
    headers={"Content-Type": "application/json"},
    data=json.dumps(data)
)

# التحقق من الرد
if response.status_code == 200:
    result = response.json()
    try:
        # استخراج النص من الرد
        generated_text = result['candidates'][0]['content']['parts'][0]['text']
        sql_json = json.loads(generated_text)
        sql_query = sql_json.get("sql", "").strip().lower()

        # تحقق من أنه SELECT فقط
        if sql_query.startswith("select") and not any(keyword in sql_query for keyword in ["delete", "update", "insert", "drop", "alter", "--", ";", "/*", "*/"]):
            print("✅ Generated SQL Query:")
            print(sql_query)
        else:
            print("⚠️ Unsafe or non-SELECT query detected:")
            print(sql_query)

    except Exception as e:
        print("⚠️ Unexpected response format:", result)
else:
    print("❌ Error:", response.status_code)
    print(response.text)
