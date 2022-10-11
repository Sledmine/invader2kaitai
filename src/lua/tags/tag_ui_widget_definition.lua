-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

require("tag_header")
TagUiWidgetDefinition = class.class(KaitaiStruct)

TagUiWidgetDefinition.UIEventHandlerReferenceFunction = enum.Enum {
  null = 0,
  list_goto_next_item = 1,
  list_goto_previous_item = 2,
  unused = 3,
  unused1 = 4,
  initialize_sp_level_list_solo = 5,
  initialize_sp_level_list_coop = 6,
  dispose_sp_level_list = 7,
  solo_level_set_map = 8,
  set_difficulty = 9,
  start_new_game = 10,
  pause_game_restart_at_checkpoint = 11,
  pause_game_restart_level = 12,
  pause_game_return_to_main_menu = 13,
  clear_multiplayer_player_joins = 14,
  join_controller_to_mp_game = 15,
  initialize_net_game_server_list = 16,
  start_network_game_server = 17,
  dispose_net_game_server_list = 18,
  shutdown_network_game = 19,
  net_game_join_from_server_list = 20,
  split_screen_game_initialize = 21,
  coop_game_initialize = 22,
  main_menu_intialize = 23,
  mp_type_menu_initialize = 24,
  pick_play_stage_for_quick_start = 25,
  mp_level_list_initialize = 26,
  mp_level_list_dispose = 27,
  mp_level_select = 28,
  mp_profiles_list_initialize = 29,
  mp_profiles_list_dispose = 30,
  mp_profile_set_for_game = 31,
  swap_player_team = 32,
  net_game_join_player = 33,
  player_profile_list_initialize = 34,
  player_profile_list_dispose = 35,
  e_3wide_plyr_prof_set_for_game = 36,
  e_1wide_plyr_prof_set_for_game = 37,
  mp_profile_begin_editing = 38,
  mp_profile_end_editing = 39,
  mp_profile_set_game_engine = 40,
  mp_profile_change_name = 41,
  mp_profile_set_ctf_rules = 42,
  mp_profile_set_koth_rules = 43,
  mp_profile_set_slayer_rules = 44,
  mp_profile_set_oddball_rules = 45,
  mp_profile_set_racing_rules = 46,
  mp_profile_set_player_options = 47,
  mp_profile_set_item_options = 48,
  mp_profile_set_indicator_opts = 49,
  mp_profile_init_game_engine = 50,
  mp_profile_init_name = 51,
  mp_profile_init_ctf_rules = 52,
  mp_profile_init_koth_rules = 53,
  mp_profile_init_slayer_rules = 54,
  mp_profile_init_oddball_rules = 55,
  mp_profile_init_racing_rules = 56,
  mp_profile_init_player_opts = 57,
  mp_profile_init_item_options = 58,
  mp_profile_init_indicator_opts = 59,
  mp_profile_save_changes = 60,
  color_picker_menu_initialize = 61,
  color_picker_menu_dispose = 62,
  color_picker_select_color = 63,
  player_profile_begin_editing = 64,
  player_profile_end_editing = 65,
  player_profile_change_name = 66,
  player_profile_save_changes = 67,
  plyr_prf_init_cntl_settings = 68,
  plyr_prf_init_adv_cntl_set = 69,
  plyr_prf_save_cntl_settings = 70,
  plyr_prf_save_adv_cntl_set = 71,
  mp_game_player_quit = 72,
  main_menu_switch_to_solo_game = 73,
  request_del_player_profile = 74,
  request_del_playlist_profile = 75,
  final_del_player_profile = 76,
  final_del_playlist_profile = 77,
  cancel_profile_delete = 78,
  create_edit_playlist_profile = 79,
  create_edit_player_profile = 80,
  net_game_speed_start = 81,
  net_game_delay_start = 82,
  net_server_accept_conx = 83,
  net_server_defer_start = 84,
  net_server_allow_start = 85,
  disable_if_no_xdemos = 86,
  run_xdemos = 87,
  sp_reset_controller_choices = 88,
  sp_set_p1_controller_choice = 89,
  sp_set_p2_controller_choice = 90,
  error_if_no_network_connection = 91,
  start_server_if_none_advertised = 92,
  net_game_unjoin_player = 93,
  close_if_not_editing_profile = 94,
  exit_to_xbox_dashboard = 95,
  new_campaign_chosen = 96,
  new_campaign_decision = 97,
  pop_history_stack_once = 98,
  difficulty_menu_init = 99,
  begin_music_fade_out = 100,
  new_game_if_no_plyr_profiles = 101,
  exit_gracefully_to_xbox_dashboard = 102,
  pause_game_invert_pitch = 103,
  start_new_coop_game = 104,
  pause_game_invert_spinner_get = 105,
  pause_game_invert_spinner_set = 106,
  main_menu_quit_game = 107,
  mouse_emit_accept_event = 108,
  mouse_emit_back_event = 109,
  mouse_emit_dpad_left_event = 110,
  mouse_emit_dpad_right_event = 111,
  mouse_spinner_3wide_click = 112,
  controls_screen_init = 113,
  video_screen_init = 114,
  controls_begin_binding = 115,
  gamespy_screen_init = 116,
  gamespy_screen_dispose = 117,
  gamespy_select_header = 118,
  gamespy_select_item = 119,
  gamespy_select_button = 120,
  plr_prof_init_mouse_set = 121,
  plr_prof_change_mouse_set = 122,
  plr_prof_init_audio_set = 123,
  plr_prof_change_audio_set = 124,
  plr_prof_change_video_set = 125,
  controls_screen_dispose = 126,
  controls_screen_change_set = 127,
  mouse_emit_x_event = 128,
  gamepad_screen_init = 129,
  gamepad_screen_dispose = 130,
  gamepad_screen_change_gamepads = 131,
  gamepad_screen_select_item = 132,
  mouse_screen_defaults = 133,
  audio_screen_defaults = 134,
  video_screen_defaults = 135,
  controls_screen_defaults = 136,
  profile_set_edit_begin = 137,
  profile_manager_delete = 138,
  profile_manager_select = 139,
  gamespy_dismiss_error = 140,
  server_settings_init = 141,
  ss_edit_server_name = 142,
  ss_edit_server_password = 143,
  ss_start_game = 144,
  video_test_dialog_init = 145,
  video_test_dialog_dispose = 146,
  video_test_dialog_accept = 147,
  gamespy_dismiss_filters = 148,
  gamespy_update_filter_settings = 149,
  gamespy_back_handler = 150,
  mouse_spinner_1wide_click = 151,
  controls_back_handler = 152,
  controls_advanced_launch = 153,
  controls_advanced_ok = 154,
  mp_pause_menu_open = 155,
  mp_game_options_open = 156,
  mp_choose_team = 157,
  mp_prof_init_vehicle_options = 158,
  mp_prof_save_vehicle_options = 159,
  single_prev_cl_item_activated = 160,
  mp_prof_init_teamplay_options = 161,
  mp_prof_save_teamplay_options = 162,
  mp_game_options_choose = 163,
  emit_custom_activation_event = 164,
  plr_prof_cancel_audio_set = 165,
  plr_prof_init_network_options = 166,
  plr_prof_save_network_options = 167,
  credits_post_render = 168,
  difficulty_item_select = 169,
  credits_initialize = 170,
  credits_dispose = 171,
  gamespy_get_patch = 172,
  video_screen_dispose = 173,
  campaign_menu_init = 174,
  campaign_menu_continue = 175,
  load_game_menu_init = 176,
  load_game_menu_dispose = 177,
  load_game_menu_activated = 178,
  solo_menu_save_checkpoint = 179,
  mp_type_set_mode = 180,
  checking_for_updates_ok = 181,
  checking_for_updates_dismiss = 182,
  direct_ip_connect_init = 183,
  direct_ip_connect_go = 184,
  direct_ip_edit_field = 185,
  network_settings_edit_a_port = 186,
  network_settings_defaults = 187,
  load_game_menu_delete_request = 188,
  load_game_menu_delete_finish = 189,
}

TagUiWidgetDefinition.UIGameDataInputReferenceFunction = enum.Enum {
  null = 0,
  player_settings_menu_update_desc = 1,
  unused = 2,
  playlist_settings_menu_update_desc = 3,
  gametype_select_menu_update_desc = 4,
  multiplayer_type_menu_update_desc = 5,
  solo_level_select_update = 6,
  difficulty_menu_update_desc = 7,
  build_number_textbox_only = 8,
  server_list_update = 9,
  network_pregame_status_update = 10,
  splitscreen_pregame_status_update = 11,
  net_splitscreen_prejoin_players = 12,
  mp_profile_list_update = 13,
  e_3wide_player_profile_list_update = 14,
  plyr_prof_edit_select_menu_upd8 = 15,
  player_profile_small_menu_update = 16,
  game_settings_lists_text_update = 17,
  solo_game_objective_text = 18,
  color_picker_update = 19,
  game_settings_lists_pic_update = 20,
  main_menu_fake_animate = 21,
  mp_level_select_update = 22,
  get_active_plyr_profile_name = 23,
  get_edit_plyr_profile_name = 24,
  get_edit_game_settings_name = 25,
  get_active_plyr_profile_color = 26,
  mp_set_textbox_map_name = 27,
  mp_set_textbox_game_ruleset = 28,
  mp_set_textbox_teams_noteams = 29,
  mp_set_textbox_score_limit = 30,
  mp_set_textbox_score_limit_type = 31,
  mp_set_bitmap_for_map = 32,
  mp_set_bitmap_for_ruleset = 33,
  mp_set_textbox = 34,
  mp_edit_profile_set_rule_text = 35,
  system_link_status_check = 36,
  mp_game_directions = 37,
  teams_no_teams_bitmap_update = 38,
  warn_if_diff_will_nuke_saved_game = 39,
  dim_if_no_net_cable = 40,
  pause_game_set_textbox_inverted = 41,
  dim_unless_two_controllers = 42,
  controls_update_menu = 43,
  video_menu_update = 44,
  gamespy_screen_update = 45,
  common_button_bar_update = 46,
  gamepad_update_menu = 47,
  server_settings_update = 48,
  audio_menu_update = 49,
  mp_prof_vehicles_update = 50,
  solo_map_list_update = 51,
  mp_map_list_update = 52,
  gt_select_list_update = 53,
  gt_edit_list_update = 54,
  load_game_list_update = 55,
  checking_for_updates = 56,
  direct_ip_connect_update = 57,
  network_settings_update = 58,
}

TagUiWidgetDefinition.UIWidgetType = enum.Enum {
  container = 0,
  text_box = 1,
  spinner_list = 2,
  column_list = 3,
  game_model_not_implemented = 4,
  movie_not_implemented = 5,
  custom_not_implemented = 6,
}

TagUiWidgetDefinition.UIJustification = enum.Enum {
  left_justify = 0,
  right_justify = 1,
  center_justify = 2,
}

TagUiWidgetDefinition.UIEventType = enum.Enum {
  a_button = 0,
  b_button = 1,
  x_button = 2,
  y_button = 3,
  black_button = 4,
  white_button = 5,
  left_trigger = 6,
  right_trigger = 7,
  dpad_up = 8,
  dpad_down = 9,
  dpad_left = 10,
  dpad_right = 11,
  start_button = 12,
  back_button = 13,
  left_thumb = 14,
  right_thumb = 15,
  left_analog_stick_up = 16,
  left_analog_stick_down = 17,
  left_analog_stick_left = 18,
  left_analog_stick_right = 19,
  left_analog_stick_up_1 = 20,
  right_analog_stick_down = 21,
  right_analog_stick_left = 22,
  right_analog_stick_right = 23,
  created = 24,
  deleted = 25,
  get_focus = 26,
  lose_focus = 27,
  left_mouse = 28,
  middle_mouse = 29,
  right_mouse = 30,
  double_click = 31,
  custom_activation = 32,
  post_render = 33,
}

TagUiWidgetDefinition.UIReplaceFunction = enum.Enum {
  null = 0,
  widget_s_controller = 1,
  build_number = 2,
  pid = 3,
}

TagUiWidgetDefinition.UIControllerIndex = enum.Enum {
  player_1 = 0,
  player_2 = 1,
  player_3 = 2,
  player_4 = 3,
  any_player = 4,
}

function TagUiWidgetDefinition:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition:_read()
  self.header = TagHeader(self._io)
  self.widget_type = TagUiWidgetDefinition.UIWidgetType(self._io:read_u2be())
  self.controller_index = TagUiWidgetDefinition.UIControllerIndex(self._io:read_u2be())
  self.name = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.bounds = TagUiWidgetDefinition.Rectangle2D(self._io, self, self._root)
  self.flags = TagUiWidgetDefinition.UIWidgetDefinitionFlags(self._io, self, self._root)
  self.milliseconds_to_auto_close = self._io:read_s4be()
  self.milliseconds_auto_close_fade_time = self._io:read_s4be()
  self.background_bitmap = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.game_data_inputs = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self.event_handlers = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self.search_and_replace_functions = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self._unnamed12 = self._io:read_bytes(128)
  self.text_label_unicode_strings_list = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.text_font = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.text_color = TagUiWidgetDefinition.ColorARGB(self._io, self, self._root)
  self.justification = TagUiWidgetDefinition.UIJustification(self._io:read_u2be())
  self.flags_1 = TagUiWidgetDefinition.UIWidgetDefinitionFlags1(self._io, self, self._root)
  self._unnamed18 = self._io:read_bytes(12)
  self.string_list_index = self._io:read_u2be()
  self.horiz_offset = self._io:read_s2be()
  self.vert_offset = self._io:read_s2be()
  self._unnamed22 = self._io:read_bytes(26)
  self._unnamed23 = self._io:read_bytes(2)
  self.flags_2 = TagUiWidgetDefinition.UIWidgetDefinitionFlags2(self._io, self, self._root)
  self.list_header_bitmap = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.list_footer_bitmap = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.header_bounds = TagUiWidgetDefinition.Rectangle2D(self._io, self, self._root)
  self.footer_bounds = TagUiWidgetDefinition.Rectangle2D(self._io, self, self._root)
  self._unnamed29 = self._io:read_bytes(32)
  self.extended_description_widget = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self._unnamed31 = self._io:read_bytes(32)
  self._unnamed32 = self._io:read_bytes(256)
  self.conditional_widgets = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self._unnamed34 = self._io:read_bytes(128)
  self._unnamed35 = self._io:read_bytes(128)
  self.child_widgets = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
end


TagUiWidgetDefinition.Point2DInt = class.class(KaitaiStruct)

function TagUiWidgetDefinition.Point2DInt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.Point2DInt:_read()
  self.x = self._io:read_s2be()
  self.y = self._io:read_s2be()
end


TagUiWidgetDefinition.GameDataInputReference = class.class(KaitaiStruct)

function TagUiWidgetDefinition.GameDataInputReference:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.GameDataInputReference:_read()
  self.function = TagUiWidgetDefinition.UIGameDataInputReferenceFunction(self._io:read_u2be())
  self._unnamed1 = self._io:read_bytes(2)
  self._unnamed2 = self._io:read_bytes(32)
end


TagUiWidgetDefinition.UIWidgetDefinitionFlags2 = class.class(KaitaiStruct)

function TagUiWidgetDefinition.UIWidgetDefinitionFlags2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.UIWidgetDefinitionFlags2:_read()
  self.u_i_widget_definition_flags2 = self._io:read_bits_int_be(32)
end


TagUiWidgetDefinition.UIWidgetDefinitionFlags = class.class(KaitaiStruct)

function TagUiWidgetDefinition.UIWidgetDefinitionFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.UIWidgetDefinitionFlags:_read()
  self.u_i_widget_definition_flags = self._io:read_bits_int_be(32)
end


TagUiWidgetDefinition.EventHandlerReferencesFlags = class.class(KaitaiStruct)

function TagUiWidgetDefinition.EventHandlerReferencesFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.EventHandlerReferencesFlags:_read()
  self.event_handler_references_flags = self._io:read_bits_int_be(32)
end


TagUiWidgetDefinition.SearchAndReplaceReference = class.class(KaitaiStruct)

function TagUiWidgetDefinition.SearchAndReplaceReference:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.SearchAndReplaceReference:_read()
  self.search_string = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.replace_function = TagUiWidgetDefinition.UIReplaceFunction(self._io:read_u2be())
end


TagUiWidgetDefinition.UIWidgetDefinition = class.class(KaitaiStruct)

function TagUiWidgetDefinition.UIWidgetDefinition:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.UIWidgetDefinition:_read()
  self.widget_type = TagUiWidgetDefinition.UIWidgetType(self._io:read_u2be())
  self.controller_index = TagUiWidgetDefinition.UIControllerIndex(self._io:read_u2be())
  self.name = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.bounds = TagUiWidgetDefinition.Rectangle2D(self._io, self, self._root)
  self.flags = TagUiWidgetDefinition.UIWidgetDefinitionFlags(self._io, self, self._root)
  self.milliseconds_to_auto_close = self._io:read_s4be()
  self.milliseconds_auto_close_fade_time = self._io:read_s4be()
  self.background_bitmap = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.game_data_inputs = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self.event_handlers = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self.search_and_replace_functions = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self._unnamed11 = self._io:read_bytes(128)
  self.text_label_unicode_strings_list = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.text_font = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.text_color = TagUiWidgetDefinition.ColorARGB(self._io, self, self._root)
  self.justification = TagUiWidgetDefinition.UIJustification(self._io:read_u2be())
  self.flags_1 = TagUiWidgetDefinition.UIWidgetDefinitionFlags1(self._io, self, self._root)
  self._unnamed17 = self._io:read_bytes(12)
  self.string_list_index = self._io:read_u2be()
  self.horiz_offset = self._io:read_s2be()
  self.vert_offset = self._io:read_s2be()
  self._unnamed21 = self._io:read_bytes(26)
  self._unnamed22 = self._io:read_bytes(2)
  self.flags_2 = TagUiWidgetDefinition.UIWidgetDefinitionFlags2(self._io, self, self._root)
  self.list_header_bitmap = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.list_footer_bitmap = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.header_bounds = TagUiWidgetDefinition.Rectangle2D(self._io, self, self._root)
  self.footer_bounds = TagUiWidgetDefinition.Rectangle2D(self._io, self, self._root)
  self._unnamed28 = self._io:read_bytes(32)
  self.extended_description_widget = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self._unnamed30 = self._io:read_bytes(32)
  self._unnamed31 = self._io:read_bytes(256)
  self.conditional_widgets = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
  self._unnamed33 = self._io:read_bytes(128)
  self._unnamed34 = self._io:read_bytes(128)
  self.child_widgets = TagUiWidgetDefinition.TagReflexive(self._io, self, self._root)
end


TagUiWidgetDefinition.ConditionalWidgetReferenceFlags = class.class(KaitaiStruct)

function TagUiWidgetDefinition.ConditionalWidgetReferenceFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.ConditionalWidgetReferenceFlags:_read()
  self.conditional_widget_reference_flags = self._io:read_bits_int_be(32)
end


TagUiWidgetDefinition.Rectangle2D = class.class(KaitaiStruct)

function TagUiWidgetDefinition.Rectangle2D:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.Rectangle2D:_read()
  self.top = self._io:read_s2be()
  self.left = self._io:read_s2be()
  self.bottom = self._io:read_s2be()
  self.right = self._io:read_s2be()
end


TagUiWidgetDefinition.TagDependency = class.class(KaitaiStruct)

function TagUiWidgetDefinition.TagDependency:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.TagDependency:_read()
  self.tag_fourcc = self._io:read_u4be()
  self.path_pointer = self._io:read_u4be()
  self.path_size = self._io:read_u4be()
  self.tag_id = self._io:read_u4be()
end


TagUiWidgetDefinition.ColorARGBInt = class.class(KaitaiStruct)

function TagUiWidgetDefinition.ColorARGBInt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.ColorARGBInt:_read()
  self.blue = self._io:read_u1()
  self.green = self._io:read_u1()
  self.red = self._io:read_u1()
  self.alpha = self._io:read_u1()
end


TagUiWidgetDefinition.ConditionalWidgetReference = class.class(KaitaiStruct)

function TagUiWidgetDefinition.ConditionalWidgetReference:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.ConditionalWidgetReference:_read()
  self.widget_tag = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.name = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.flags = TagUiWidgetDefinition.ConditionalWidgetReferenceFlags(self._io, self, self._root)
  self.custom_controller_index = self._io:read_u2be()
  self._unnamed4 = self._io:read_bytes(26)
end


TagUiWidgetDefinition.TagDataOffset = class.class(KaitaiStruct)

function TagUiWidgetDefinition.TagDataOffset:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.TagDataOffset:_read()
  self.size = self._io:read_u4be()
  self.external = self._io:read_u4be()
  self.file_offset = self._io:read_u4be()
  self.pointer = self._io:read_bytes(8)
end


TagUiWidgetDefinition.UIWidgetDefinitionFlags1 = class.class(KaitaiStruct)

function TagUiWidgetDefinition.UIWidgetDefinitionFlags1:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.UIWidgetDefinitionFlags1:_read()
  self.u_i_widget_definition_flags1 = self._io:read_bits_int_be(32)
end


TagUiWidgetDefinition.Point2D = class.class(KaitaiStruct)

function TagUiWidgetDefinition.Point2D:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.Point2D:_read()
  self.x = self._io:read_f4be()
  self.y = self._io:read_f4be()
end


TagUiWidgetDefinition.ChildWidgetReference = class.class(KaitaiStruct)

function TagUiWidgetDefinition.ChildWidgetReference:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.ChildWidgetReference:_read()
  self.widget_tag = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.name = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.flags = TagUiWidgetDefinition.ChildWidgetReferenceFlags(self._io, self, self._root)
  self.custom_controller_index = self._io:read_u2be()
  self.vertical_offset = self._io:read_s2be()
  self.horizontal_offset = self._io:read_s2be()
  self._unnamed6 = self._io:read_bytes(22)
end


TagUiWidgetDefinition.EventHandlerReference = class.class(KaitaiStruct)

function TagUiWidgetDefinition.EventHandlerReference:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.EventHandlerReference:_read()
  self.flags = TagUiWidgetDefinition.EventHandlerReferencesFlags(self._io, self, self._root)
  self.event_type = TagUiWidgetDefinition.UIEventType(self._io:read_u2be())
  self.function = TagUiWidgetDefinition.UIEventHandlerReferenceFunction(self._io:read_u2be())
  self.widget_tag = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.sound_effect = TagUiWidgetDefinition.TagDependency(self._io, self, self._root)
  self.script = str_decode.decode(self._io:read_bytes(32), "ASCII")
end


TagUiWidgetDefinition.ColorARGB = class.class(KaitaiStruct)

function TagUiWidgetDefinition.ColorARGB:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.ColorARGB:_read()
  self.alpha = self._io:read_f4be()
  self.red = self._io:read_f4be()
  self.green = self._io:read_f4be()
  self.blue = self._io:read_f4be()
end


TagUiWidgetDefinition.TagReflexive = class.class(KaitaiStruct)

function TagUiWidgetDefinition.TagReflexive:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.TagReflexive:_read()
  self.count = self._io:read_u4be()
  self.offset = self._io:read_u4be()
end


TagUiWidgetDefinition.ChildWidgetReferenceFlags = class.class(KaitaiStruct)

function TagUiWidgetDefinition.ChildWidgetReferenceFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUiWidgetDefinition.ChildWidgetReferenceFlags:_read()
  self.child_widget_reference_flags = self._io:read_bits_int_be(32)
end


