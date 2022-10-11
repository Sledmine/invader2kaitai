types:
  tag_data_offset:
    seq:
      - type: u4
        id: size
      - type: u4
        id: external
      - type: u4
        id: file_offset
      - size: 8
        id: pointer
  tag_reflexive:
    seq:
      - type: u4
        id: count
      - type: u4
        id: offset
      - size: 4
  event_handler_references_flags:
    seq:
      - type: b32
        id: event_handler_references_flags
  u_i_widget_definition_flags2:
    seq:
      - type: b32
        id: u_i_widget_definition_flags2
  event_handler_reference:
    seq:
      - type: event_handler_references_flags
        id: flags
      - enum: u_i_event_type
        type: u2
        id: event_type
      - enum: u_i_event_handler_reference_function
        type: u2
        id: function
      - type: tag_dependency
        id: widget_tag
      - type: tag_dependency
        id: sound_effect
      - size: 32
        encoding: ASCII
        type: str
        id: script
  rectangle2_d:
    seq:
      - type: s2
        id: top
      - type: s2
        id: left
      - type: s2
        id: bottom
      - type: s2
        id: right
  point2_d_int:
    seq:
      - type: s2
        id: x
      - type: s2
        id: "y"
  child_widget_reference_flags:
    seq:
      - type: b32
        id: child_widget_reference_flags
  search_and_replace_reference:
    seq:
      - size: 32
        encoding: ASCII
        type: str
        id: search_string
      - enum: u_i_replace_function
        type: u2
        id: replace_function
  color_a_r_g_b_int:
    seq:
      - type: u1
        id: blue
      - type: u1
        id: green
      - type: u1
        id: red
      - type: u1
        id: alpha
  conditional_widget_reference:
    seq:
      - type: tag_dependency
        id: widget_tag
      - size: 32
        encoding: ASCII
        type: str
        id: name
      - type: conditional_widget_reference_flags
        id: flags
      - type: u2
        id: custom_controller_index
      - size: 26
  game_data_input_reference:
    seq:
      - enum: u_i_game_data_input_reference_function
        type: u2
        id: function
      - size: 2
      - size: 32
  u_i_widget_definition:
    seq:
      - enum: u_i_widget_type
        type: u2
        id: widget_type
      - enum: u_i_controller_index
        type: u2
        id: controller_index
      - size: 32
        encoding: ASCII
        type: str
        id: name
      - type: rectangle2_d
        id: bounds
      - type: u_i_widget_definition_flags
        id: flags
      - type: s4
        id: milliseconds_to_auto_close
      - type: s4
        id: milliseconds_auto_close_fade_time
      - type: tag_dependency
        id: background_bitmap
      - struct: GameDataInputReference
        type: tag_reflexive
        id: game_data_inputs
      - struct: EventHandlerReference
        type: tag_reflexive
        id: event_handlers
      - struct: SearchAndReplaceReference
        type: tag_reflexive
        id: search_and_replace_functions
      - size: 128
      - type: tag_dependency
        id: text_label_unicode_strings_list
      - type: tag_dependency
        id: text_font
      - type: color_a_r_g_b
        id: text_color
      - enum: u_i_justification
        type: u2
        id: justification
      - type: u_i_widget_definition_flags1
        id: flags_1
      - size: 12
      - type: u2
        id: string_list_index
      - type: s2
        id: horiz_offset
      - type: s2
        id: vert_offset
      - size: 26
      - size: 2
      - type: u_i_widget_definition_flags2
        id: flags_2
      - type: tag_dependency
        id: list_header_bitmap
      - type: tag_dependency
        id: list_footer_bitmap
      - type: rectangle2_d
        id: header_bounds
      - type: rectangle2_d
        id: footer_bounds
      - size: 32
      - type: tag_dependency
        id: extended_description_widget
      - size: 32
      - size: 256
      - struct: ConditionalWidgetReference
        type: tag_reflexive
        id: conditional_widgets
      - size: 128
      - size: 128
      - struct: ChildWidgetReference
        type: tag_reflexive
        id: child_widgets
  point2_d:
    seq:
      - type: f4
        id: x
      - type: f4
        id: "y"
  tag_dependency:
    seq:
      - type: u4
        id: tag_fourcc
      - type: u4
        id: path_pointer
      - type: u4
        id: path_size
      - type: u4
        id: tag_id
  conditional_widget_reference_flags:
    seq:
      - type: b32
        id: conditional_widget_reference_flags
  color_a_r_g_b:
    seq:
      - type: f4
        id: alpha
      - type: f4
        id: red
      - type: f4
        id: green
      - type: f4
        id: blue
  u_i_widget_definition_flags1:
    seq:
      - type: b32
        id: u_i_widget_definition_flags1
  child_widget_reference:
    seq:
      - type: tag_dependency
        id: widget_tag
      - size: 32
        encoding: ASCII
        type: str
        id: name
      - type: child_widget_reference_flags
        id: flags
      - type: u2
        id: custom_controller_index
      - type: s2
        id: vertical_offset
      - type: s2
        id: horizontal_offset
      - size: 22
  u_i_widget_definition_flags:
    seq:
      - type: b32
        id: u_i_widget_definition_flags
seq:
  - type: tag_header
    id: header
  - id: widget_type
    type: u2
    enum: u_i_widget_type
  - id: controller_index
    type: u2
    enum: u_i_controller_index
  - size: 32
    id: name
    type: str
    encoding: ASCII
  - id: bounds
    type: rectangle2_d
  - id: flags
    type: u_i_widget_definition_flags
  - id: milliseconds_to_auto_close
    type: s4
  - id: milliseconds_auto_close_fade_time
    type: s4
  - id: background_bitmap
    type: tag_dependency
  - id: game_data_inputs
    type: tag_reflexive
  - id: event_handlers
    type: tag_reflexive
  - id: search_and_replace_functions
    type: tag_reflexive
  - size: 128
  - id: text_label_unicode_strings_list
    type: tag_dependency
  - id: text_font
    type: tag_dependency
  - id: text_color
    type: color_a_r_g_b
  - id: justification
    type: u2
    enum: u_i_justification
  - id: flags_1
    type: u_i_widget_definition_flags1
  - size: 12
  - id: string_list_index
    type: u2
  - id: horiz_offset
    type: s2
  - id: vert_offset
    type: s2
  - size: 26
  - size: 2
  - id: flags_2
    type: u_i_widget_definition_flags2
  - id: list_header_bitmap
    type: tag_dependency
  - id: list_footer_bitmap
    type: tag_dependency
  - id: header_bounds
    type: rectangle2_d
  - id: footer_bounds
    type: rectangle2_d
  - size: 32
  - id: extended_description_widget
    type: tag_dependency
  - size: 32
  - size: 256
  - id: conditional_widgets
    type: tag_reflexive
  - size: 128
  - size: 128
  - id: child_widgets
    type: tag_reflexive
meta:
  endian: be
  imports:
    - tag_header
  id: tag_ui_widget_definition
enums:
  u_i_game_data_input_reference_function:
    "3": playlist_settings_menu_update_desc
    "4": gametype_select_menu_update_desc
    "1": player_settings_menu_update_desc
    "2": unused
    "0": "null"
    "58": network_settings_update
    "57": direct_ip_connect_update
    "56": checking_for_updates
    "55": load_game_list_update
    "54": gt_edit_list_update
    "53": gt_select_list_update
    "52": mp_map_list_update
    "51": solo_map_list_update
    "50": mp_prof_vehicles_update
    "49": audio_menu_update
    "48": server_settings_update
    "47": gamepad_update_menu
    "46": common_button_bar_update
    "45": gamespy_screen_update
    "24": get_edit_plyr_profile_name
    "12": net_splitscreen_prejoin_players
    "9": server_list_update
    "14": e_3wide_player_profile_list_update
    "7": difficulty_menu_update_desc
    "8": build_number_textbox_only
    "5": multiplayer_type_menu_update_desc
    "6": solo_level_select_update
    "44": video_menu_update
    "43": controls_update_menu
    "42": dim_unless_two_controllers
    "41": pause_game_set_textbox_inverted
    "40": dim_if_no_net_cable
    "39": warn_if_diff_will_nuke_saved_game
    "19": color_picker_update
    "38": teams_no_teams_bitmap_update
    "37": mp_game_directions
    "36": system_link_status_check
    "35": mp_edit_profile_set_rule_text
    "34": mp_set_textbox
    "33": mp_set_bitmap_for_ruleset
    "32": mp_set_bitmap_for_map
    "31": mp_set_textbox_score_limit_type
    "30": mp_set_textbox_score_limit
    "29": mp_set_textbox_teams_noteams
    "10": network_pregame_status_update
    "27": mp_set_textbox_map_name
    "17": game_settings_lists_text_update
    "25": get_edit_game_settings_name
    "20": game_settings_lists_pic_update
    "22": mp_level_select_update
    "15": plyr_prof_edit_select_menu_upd8
    "11": splitscreen_pregame_status_update
    "23": get_active_plyr_profile_name
    "13": mp_profile_list_update
    "21": main_menu_fake_animate
    "16": player_profile_small_menu_update
    "26": get_active_plyr_profile_color
    "18": solo_game_objective_text
    "28": mp_set_textbox_game_ruleset
  u_i_event_handler_reference_function:
    "3": unused
    "4": unused1
    "93": net_game_unjoin_player
    "83": net_server_accept_conx
    "143": ss_edit_server_password
    "0": "null"
    "140": gamespy_dismiss_error
    "144": ss_start_game
    "121": plr_prof_init_mouse_set
    "167": plr_prof_save_network_options
    "9": set_difficulty
    "7": dispose_sp_level_list
    "8": solo_level_set_map
    "5": initialize_sp_level_list_solo
    "6": initialize_sp_level_list_coop
    "84": net_server_defer_start
    "94": close_if_not_editing_profile
    "153": controls_advanced_launch
    "150": gamespy_back_handler
    "136": controls_screen_defaults
    "154": controls_advanced_ok
    "131": gamepad_screen_change_gamepads
    "33": net_game_join_player
    "23": main_menu_intialize
    "13": pause_game_return_to_main_menu
    "132": gamepad_screen_select_item
    "73": main_menu_switch_to_solo_game
    "63": color_picker_select_color
    "53": mp_profile_init_koth_rules
    "43": mp_profile_set_koth_rules
    "189": load_game_menu_delete_finish
    "165": plr_prof_cancel_audio_set
    "106": pause_game_invert_spinner_set
    "109": mouse_emit_back_event
    "160": single_prev_cl_item_activated
    "164": emit_custom_activation_event
    "187": network_settings_defaults
    "95": exit_to_xbox_dashboard
    "141": server_settings_init
    "50": mp_profile_init_game_engine
    "55": mp_profile_init_oddball_rules
    "30": mp_profiles_list_dispose
    "40": mp_profile_set_game_engine
    "10": start_new_game
    "20": net_game_join_from_server_list
    "45": mp_profile_set_oddball_rules
    "35": player_profile_list_dispose
    "170": credits_initialize
    "119": gamespy_select_item
    "156": mp_game_options_open
    "174": campaign_menu_init
    "96": new_campaign_chosen
    "188": load_game_menu_delete_request
    "151": mouse_spinner_1wide_click
    "56": mp_profile_init_racing_rules
    "66": player_profile_change_name
    "76": final_del_player_profile
    "86": disable_if_no_xdemos
    "16": initialize_net_game_server_list
    "26": mp_level_list_initialize
    "36": e_3wide_plyr_prof_set_for_game
    "46": mp_profile_set_racing_rules
    "184": direct_ip_connect_go
    "186": network_settings_edit_a_port
    "180": mp_type_set_mode
    "103": pause_game_invert_pitch
    "179": solo_menu_save_checkpoint
    "129": gamepad_screen_init
    "185": direct_ip_edit_field
    "115": controls_begin_binding
    "181": checking_for_updates_ok
    "183": direct_ip_connect_init
    "104": start_new_coop_game
    "178": load_game_menu_activated
    "105": pause_game_invert_spinner_get
    "177": load_game_menu_dispose
    "148": gamespy_dismiss_filters
    "175": campaign_menu_continue
    "173": video_screen_dispose
    "127": controls_screen_change_set
    "172": gamespy_get_patch
    "138": profile_manager_delete
    "161": mp_prof_init_teamplay_options
    "169": difficulty_item_select
    "168": credits_post_render
    "108": mouse_emit_accept_event
    "87": run_xdemos
    "77": final_del_playlist_profile
    "67": player_profile_save_changes
    "57": mp_profile_init_player_opts
    "42": mp_profile_set_ctf_rules
    "37": e_1wide_plyr_prof_set_for_game
    "62": color_picker_menu_dispose
    "72": mp_game_player_quit
    "166": plr_prof_init_network_options
    "163": mp_game_options_choose
    "113": controls_screen_init
    "162": mp_prof_save_teamplay_options
    "90": sp_set_p2_controller_choice
    "159": mp_prof_save_vehicle_options
    "70": plyr_prf_save_cntl_settings
    "80": create_edit_player_profile
    "158": mp_prof_init_vehicle_options
    "157": mp_choose_team
    "155": mp_pause_menu_open
    "114": video_screen_init
    "152": controls_back_handler
    "128": mouse_emit_x_event
    "176": load_game_menu_init
    "110": mouse_emit_dpad_left_event
    "69": plyr_prf_init_adv_cntl_set
    "146": video_test_dialog_dispose
    "145": video_test_dialog_init
    "142": ss_edit_server_name
    "139": profile_manager_select
    "171": credits_dispose
    "98": pop_history_stack_once
    "137": profile_set_edit_begin
    "78": cancel_profile_delete
    "88": sp_reset_controller_choices
    "58": mp_profile_init_item_options
    "68": plyr_prf_init_cntl_settings
    "38": mp_profile_begin_editing
    "48": mp_profile_set_item_options
    "18": dispose_net_game_server_list
    "28": mp_level_select
    "91": error_if_no_network_connection
    "81": net_game_speed_start
    "135": video_screen_defaults
    "125": plr_prof_change_video_set
    "14": clear_multiplayer_player_joins
    "133": mouse_screen_defaults
    "99": difficulty_menu_init
    "149": gamespy_update_filter_settings
    "124": plr_prof_change_audio_set
    "1": list_goto_next_item
    "2": list_goto_previous_item
    "117": gamespy_screen_dispose
    "126": controls_screen_dispose
    "123": plr_prof_init_audio_set
    "120": gamespy_select_button
    "122": plr_prof_change_mouse_set
    "100": begin_music_fade_out
    "101": new_game_if_no_plyr_profiles
    "182": checking_for_updates_dismiss
    "147": video_test_dialog_accept
    "52": mp_profile_init_ctf_rules
    "118": gamespy_select_header
    "47": mp_profile_set_player_options
    "39": mp_profile_end_editing
    "24": mp_type_menu_initialize
    "29": mp_profiles_list_initialize
    "59": mp_profile_init_indicator_opts
    "49": mp_profile_set_indicator_opts
    "64": player_profile_begin_editing
    "74": request_del_player_profile
    "44": mp_profile_set_slayer_rules
    "54": mp_profile_init_slayer_rules
    "82": net_game_delay_start
    "92": start_server_if_none_advertised
    "97": new_campaign_decision
    "12": pause_game_restart_level
    "22": coop_game_initialize
    "32": swap_player_team
    "19": shutdown_network_game
    "27": mp_level_list_dispose
    "17": start_network_game_server
    "134": audio_screen_defaults
    "130": gamepad_screen_dispose
    "116": gamespy_screen_init
    "107": main_menu_quit_game
    "79": create_edit_playlist_profile
    "102": exit_gracefully_to_xbox_dashboard
    "65": player_profile_end_editing
    "111": mouse_emit_dpad_right_event
    "89": sp_set_p1_controller_choice
    "15": join_controller_to_mp_game
    "85": net_server_allow_start
    "75": request_del_playlist_profile
    "25": pick_play_stage_for_quick_start
    "34": player_profile_list_initialize
    "60": mp_profile_save_changes
    "11": pause_game_restart_at_checkpoint
    "112": mouse_spinner_3wide_click
    "31": mp_profile_set_for_game
    "21": split_screen_game_initialize
    "51": mp_profile_init_name
    "41": mp_profile_change_name
    "71": plyr_prf_save_adv_cntl_set
    "61": color_picker_menu_initialize
  u_i_replace_function:
    "3": pid
    "0": "null"
    "1": widget_s_controller
    "2": build_number
  u_i_justification:
    "0": left_justify
    "1": right_justify
    "2": center_justify
  u_i_event_type:
    "3": y_button
    "4": black_button
    "1": b_button
    "2": x_button
    "0": a_button
    "24": created
    "12": start_button
    "9": dpad_down
    "14": left_thumb
    "7": right_trigger
    "8": dpad_up
    "5": white_button
    "6": left_trigger
    "19": left_analog_stick_right
    "33": post_render
    "32": custom_activation
    "31": double_click
    "30": right_mouse
    "29": middle_mouse
    "10": dpad_left
    "27": lose_focus
    "17": left_analog_stick_down
    "25": deleted
    "20": left_analog_stick_up_1
    "22": right_analog_stick_left
    "15": right_thumb
    "11": dpad_right
    "23": right_analog_stick_right
    "13": back_button
    "21": right_analog_stick_down
    "16": left_analog_stick_up
    "26": get_focus
    "18": left_analog_stick_left
    "28": left_mouse
  u_i_controller_index:
    "3": player_4
    "4": any_player
    "1": player_2
    "2": player_3
    "0": player_1
  u_i_widget_type:
    "3": column_list
    "4": game_model_not_implemented
    "1": text_box
    "2": spinner_list
    "0": container
    "5": movie_not_implemented
    "6": custom_not_implemented
