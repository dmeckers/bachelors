export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      about_me_visibility_user_whitelist: {
        Row: {
          profile_settings_id: string
          user_uuid: string
        }
        Insert: {
          profile_settings_id: string
          user_uuid: string
        }
        Update: {
          profile_settings_id?: string
          user_uuid?: string
        }
        Relationships: [
          {
            foreignKeyName: "about_me_visibility_user_whitelist_profile_settings_id_fkey"
            columns: ["profile_settings_id"]
            isOneToOne: false
            referencedRelation: "profile_settings"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "about_me_visibility_user_whitelist_user_uuid_fkey"
            columns: ["user_uuid"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      banned: {
        Row: {
          banned: string
          banned_by: string
          inserted_at: string
          updated_at: string
        }
        Insert: {
          banned: string
          banned_by: string
          inserted_at?: string
          updated_at?: string
        }
        Update: {
          banned?: string
          banned_by?: string
          inserted_at?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "banned_banned_by_fkey"
            columns: ["banned_by"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "banned_banned_fkey"
            columns: ["banned"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      chats: {
        Row: {
          created_at: string
          id: number
          updated_at: string
        }
        Insert: {
          created_at?: string
          id?: never
          updated_at?: string
        }
        Update: {
          created_at?: string
          id?: never
          updated_at?: string
        }
        Relationships: []
      }
      deleted_messages: {
        Row: {
          chat_id: number | null
          created_at: string
          message_id: number
          user_id: string
        }
        Insert: {
          chat_id?: number | null
          created_at?: string
          message_id: number
          user_id: string
        }
        Update: {
          chat_id?: number | null
          created_at?: string
          message_id?: number
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "public_deleted_messages_chat_id_fkey"
            columns: ["chat_id"]
            isOneToOne: false
            referencedRelation: "chats"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_deleted_messages_message_id_fkey"
            columns: ["message_id"]
            isOneToOne: false
            referencedRelation: "messages"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_deleted_messages_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      display_last_seen_vsisibility_whitelist: {
        Row: {
          profile_settings_id: string
          user_uuid: string
        }
        Insert: {
          profile_settings_id: string
          user_uuid: string
        }
        Update: {
          profile_settings_id?: string
          user_uuid?: string
        }
        Relationships: [
          {
            foreignKeyName: "display_last_seen_vsisibility_whitelis_profile_settings_id_fkey"
            columns: ["profile_settings_id"]
            isOneToOne: false
            referencedRelation: "profile_settings"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "display_last_seen_vsisibility_whitelist_user_uuid_fkey"
            columns: ["user_uuid"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      friend_invites: {
        Row: {
          id: number
          inserted_at: string
          status: string | null
          updated_at: string
          user_received: string | null
          user_sent: string | null
        }
        Insert: {
          id?: number
          inserted_at?: string
          status?: string | null
          updated_at?: string
          user_received?: string | null
          user_sent?: string | null
        }
        Update: {
          id?: number
          inserted_at?: string
          status?: string | null
          updated_at?: string
          user_received?: string | null
          user_sent?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "friend_invites_user_received_fkey"
            columns: ["user_received"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "friend_invites_user_sent_fkey"
            columns: ["user_sent"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      friends: {
        Row: {
          inserted_at: string
          updated_at: string
          user_one_id: string
          user_two_id: string
        }
        Insert: {
          inserted_at?: string
          updated_at?: string
          user_one_id: string
          user_two_id: string
        }
        Update: {
          inserted_at?: string
          updated_at?: string
          user_one_id?: string
          user_two_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "friends_user_one_id_fkey"
            columns: ["user_one_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "friends_user_two_id_fkey"
            columns: ["user_two_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      invite_to_communities_user_whitelist: {
        Row: {
          profile_settings_id: string
          user_uuid: string
        }
        Insert: {
          profile_settings_id: string
          user_uuid: string
        }
        Update: {
          profile_settings_id?: string
          user_uuid?: string
        }
        Relationships: [
          {
            foreignKeyName: "invite_to_community_user_whitelist_profile_settings_id_fkey"
            columns: ["profile_settings_id"]
            isOneToOne: false
            referencedRelation: "profile_settings"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "invite_to_community_user_whitelist_user_uuid_fkey"
            columns: ["user_uuid"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      invite_to_jams_user_whitelist: {
        Row: {
          profile_settings_id: string
          user_uuid: string
        }
        Insert: {
          profile_settings_id: string
          user_uuid: string
        }
        Update: {
          profile_settings_id?: string
          user_uuid?: string
        }
        Relationships: [
          {
            foreignKeyName: "invite_to_jam_user_whitelist_profile_settings_id_fkey"
            columns: ["profile_settings_id"]
            isOneToOne: false
            referencedRelation: "profile_settings"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "invite_to_jam_user_whitelist_user_uuid_fkey"
            columns: ["user_uuid"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      jam_invites: {
        Row: {
          id: number
          inserted_at: string
          invited_user_id: string | null
          jam_id: number | null
          sended_from_user_id: string | null
          status: string | null
          updated_at: string
        }
        Insert: {
          id?: number
          inserted_at?: string
          invited_user_id?: string | null
          jam_id?: number | null
          sended_from_user_id?: string | null
          status?: string | null
          updated_at?: string
        }
        Update: {
          id?: number
          inserted_at?: string
          invited_user_id?: string | null
          jam_id?: number | null
          sended_from_user_id?: string | null
          status?: string | null
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "jam_invites_invited_user_id_fkey"
            columns: ["invited_user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "jam_invites_jam_id_fkey"
            columns: ["jam_id"]
            isOneToOne: false
            referencedRelation: "jams"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "jam_invites_sended_from_user_id_fkey"
            columns: ["sended_from_user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      jam_join_requests: {
        Row: {
          created_at: string
          filled_form: Json | null
          id: number
          jam_id: number
          seen_at: string | null
          status: Database["public"]["Enums"]["process_step_type_enum"]
          user_id: string
        }
        Insert: {
          created_at?: string
          filled_form?: Json | null
          id?: number
          jam_id: number
          seen_at?: string | null
          status?: Database["public"]["Enums"]["process_step_type_enum"]
          user_id: string
        }
        Update: {
          created_at?: string
          filled_form?: Json | null
          id?: number
          jam_id?: number
          seen_at?: string | null
          status?: Database["public"]["Enums"]["process_step_type_enum"]
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "jam_form_journal_jam_id_fkey"
            columns: ["jam_id"]
            isOneToOne: false
            referencedRelation: "jams"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "jam_form_journal_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      jams: {
        Row: {
          background_url: string | null
          creator_id: string | null
          date: string
          description: string | null
          extra_information: string | null
          form: Json | null
          icon_url: string | null
          id: number
          inserted_at: string
          invites_only: boolean | null
          invites_per_member: number | null
          join_type: Database["public"]["Enums"]["jam_join_type"] | null
          lat: number | null
          location: unknown
          location_name: string
          lon: number | null
          max_participants: number | null
          name: string
          qr_mode: Database["public"]["Enums"]["jam_qr_mode_enum"] | null
          updated_at: string
        }
        Insert: {
          background_url?: string | null
          creator_id?: string | null
          date?: string
          description?: string | null
          extra_information?: string | null
          form?: Json | null
          icon_url?: string | null
          id?: never
          inserted_at?: string
          invites_only?: boolean | null
          invites_per_member?: number | null
          join_type?: Database["public"]["Enums"]["jam_join_type"] | null
          lat?: number | null
          location: unknown
          location_name: string
          lon?: number | null
          max_participants?: number | null
          name: string
          qr_mode?: Database["public"]["Enums"]["jam_qr_mode_enum"] | null
          updated_at?: string
        }
        Update: {
          background_url?: string | null
          creator_id?: string | null
          date?: string
          description?: string | null
          extra_information?: string | null
          form?: Json | null
          icon_url?: string | null
          id?: never
          inserted_at?: string
          invites_only?: boolean | null
          invites_per_member?: number | null
          join_type?: Database["public"]["Enums"]["jam_join_type"] | null
          lat?: number | null
          location?: unknown
          location_name?: string
          lon?: number | null
          max_participants?: number | null
          name?: string
          qr_mode?: Database["public"]["Enums"]["jam_qr_mode_enum"] | null
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "jams_creator_id_fkey"
            columns: ["creator_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      jams_users: {
        Row: {
          id: number
          inserted_at: string
          invites_used: number | null
          is_admin: boolean | null
          jam_id: number
          updated_at: string
          user_id: string
        }
        Insert: {
          id?: number
          inserted_at?: string
          invites_used?: number | null
          is_admin?: boolean | null
          jam_id: number
          updated_at?: string
          user_id: string
        }
        Update: {
          id?: number
          inserted_at?: string
          invites_used?: number | null
          is_admin?: boolean | null
          jam_id?: number
          updated_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "jams_users_jam_id_fkey"
            columns: ["jam_id"]
            isOneToOne: false
            referencedRelation: "jams"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "jams_users_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      jams_vibes: {
        Row: {
          id: number
          inserted_at: string
          jam_id: number
          updated_at: string
          vibe_id: number
        }
        Insert: {
          id?: number
          inserted_at?: string
          jam_id: number
          updated_at?: string
          vibe_id: number
        }
        Update: {
          id?: number
          inserted_at?: string
          jam_id?: number
          updated_at?: string
          vibe_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "jams_vibes_jam_id_fkey"
            columns: ["jam_id"]
            isOneToOne: false
            referencedRelation: "jams"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "jams_vibes_vibe_id_fkey"
            columns: ["vibe_id"]
            isOneToOne: false
            referencedRelation: "vibes"
            referencedColumns: ["id"]
          },
        ]
      }
      map_visibility_user_whitelist: {
        Row: {
          profile_settings_id: string
          user_uuid: string
        }
        Insert: {
          profile_settings_id: string
          user_uuid: string
        }
        Update: {
          profile_settings_id?: string
          user_uuid?: string
        }
        Relationships: [
          {
            foreignKeyName: "map_visibility_user_whitelist_profile_settings_id_fkey"
            columns: ["profile_settings_id"]
            isOneToOne: false
            referencedRelation: "profile_settings"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "map_visibility_user_whitelist_user_uuid_fkey"
            columns: ["user_uuid"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      message_status: {
        Row: {
          created_at: string
          id: number
          message_id: number
          message_status:
            | Database["public"]["Enums"]["message_status_enum"]
            | null
          read_at: string | null
          user_id: string
        }
        Insert: {
          created_at?: string
          id?: number
          message_id: number
          message_status?:
            | Database["public"]["Enums"]["message_status_enum"]
            | null
          read_at?: string | null
          user_id: string
        }
        Update: {
          created_at?: string
          id?: number
          message_id?: number
          message_status?:
            | Database["public"]["Enums"]["message_status_enum"]
            | null
          read_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "public_message_status_message_id_fkey"
            columns: ["message_id"]
            isOneToOne: false
            referencedRelation: "messages"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_message_status_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      messages: {
        Row: {
          chat_id: number | null
          edited_at: string | null
          id: number
          media_content: string | null
          message_text: string | null
          message_type: Database["public"]["Enums"]["msg_type_enum"] | null
          pinned_state:
            | Database["public"]["Enums"]["pinned_message_state"]
            | null
          replied_to: number | null
          sender_id: string | null
          sent_at: string | null
        }
        Insert: {
          chat_id?: number | null
          edited_at?: string | null
          id?: number
          media_content?: string | null
          message_text?: string | null
          message_type?: Database["public"]["Enums"]["msg_type_enum"] | null
          pinned_state?:
            | Database["public"]["Enums"]["pinned_message_state"]
            | null
          replied_to?: number | null
          sender_id?: string | null
          sent_at?: string | null
        }
        Update: {
          chat_id?: number | null
          edited_at?: string | null
          id?: number
          media_content?: string | null
          message_text?: string | null
          message_type?: Database["public"]["Enums"]["msg_type_enum"] | null
          pinned_state?:
            | Database["public"]["Enums"]["pinned_message_state"]
            | null
          replied_to?: number | null
          sender_id?: string | null
          sent_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_messages_chat_id_fkey"
            columns: ["chat_id"]
            isOneToOne: false
            referencedRelation: "chats"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_messages_replied_to_fkey"
            columns: ["replied_to"]
            isOneToOne: false
            referencedRelation: "messages"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_messages_sender_id_fkey"
            columns: ["sender_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      own_encrypted: {
        Row: {
          created_at: string
          id: number
          message_id: number | null
          message_media: string | null
          message_text: string | null
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: number
          message_id?: number | null
          message_media?: string | null
          message_text?: string | null
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: number
          message_id?: number | null
          message_media?: string | null
          message_text?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_own_encrypted_message_id_fkey"
            columns: ["message_id"]
            isOneToOne: false
            referencedRelation: "messages"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_own_encrypted_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      phone_visibility_user_whitelist: {
        Row: {
          profile_settings_id: string
          user_uuid: string
        }
        Insert: {
          profile_settings_id: string
          user_uuid: string
        }
        Update: {
          profile_settings_id?: string
          user_uuid?: string
        }
        Relationships: [
          {
            foreignKeyName: "phone_visibility_user_whitelist_profile_settings_id_fkey"
            columns: ["profile_settings_id"]
            isOneToOne: false
            referencedRelation: "profile_settings"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "phone_visibility_user_whitelist_user_uuid_fkey"
            columns: ["user_uuid"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      profile_settings: {
        Row: {
          id: string
          two_step_auth_enabled: boolean | null
          updated_at: string | null
        }
        Insert: {
          id: string
          two_step_auth_enabled?: boolean | null
          updated_at?: string | null
        }
        Update: {
          id?: string
          two_step_auth_enabled?: boolean | null
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "profile_settings_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      profiles: {
        Row: {
          avatar: string | null
          fcm_token: string | null
          full_name: string | null
          id: string
          inserted_at: string | null
          is_online: boolean | null
          last_active_at: string | null
          last_sign_in_at: string | null
          profile_status: string | null
          public_key: string | null
          updated_at: string | null
          username: string | null
          website: string | null
        }
        Insert: {
          avatar?: string | null
          fcm_token?: string | null
          full_name?: string | null
          id: string
          inserted_at?: string | null
          is_online?: boolean | null
          last_active_at?: string | null
          last_sign_in_at?: string | null
          profile_status?: string | null
          public_key?: string | null
          updated_at?: string | null
          username?: string | null
          website?: string | null
        }
        Update: {
          avatar?: string | null
          fcm_token?: string | null
          full_name?: string | null
          id?: string
          inserted_at?: string | null
          is_online?: boolean | null
          last_active_at?: string | null
          last_sign_in_at?: string | null
          profile_status?: string | null
          public_key?: string | null
          updated_at?: string | null
          username?: string | null
          website?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "profiles_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
      security_profile_settings: {
        Row: {
          about_me_visibility: string
          can_be_found_by_phone: string
          can_be_invited_to_communities: string
          can_be_invited_to_jams: string
          display_last_seen_visibility: string
          id: string
          map_visibility: string
          phone_visibility: string
        }
        Insert: {
          about_me_visibility?: string
          can_be_found_by_phone?: string
          can_be_invited_to_communities?: string
          can_be_invited_to_jams?: string
          display_last_seen_visibility?: string
          id: string
          map_visibility?: string
          phone_visibility?: string
        }
        Update: {
          about_me_visibility?: string
          can_be_found_by_phone?: string
          can_be_invited_to_communities?: string
          can_be_invited_to_jams?: string
          display_last_seen_visibility?: string
          id?: string
          map_visibility?: string
          phone_visibility?: string
        }
        Relationships: [
          {
            foreignKeyName: "security_profile_settings_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profile_settings"
            referencedColumns: ["id"]
          },
        ]
      }
      user_locations: {
        Row: {
          created_at: string
          id: string
          lat: number | null
          location: unknown | null
          lon: number | null
          updated_at: string | null
        }
        Insert: {
          created_at?: string
          id: string
          lat?: number | null
          location?: unknown | null
          lon?: number | null
          updated_at?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          lat?: number | null
          location?: unknown | null
          lon?: number | null
          updated_at?: string | null
        }
        Relationships: []
      }
      user_secrets: {
        Row: {
          created_at: string
          id: string
          secret: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          secret?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          secret?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_user_secrets_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      users_chats: {
        Row: {
          chat_id: number
          cleared_at: string | null
          created_at: string | null
          id: number
          is_archived: boolean | null
          is_muted: boolean | null
          is_pinned: boolean | null
          muted_till: string | null
          to_hide: boolean | null
          user_id: string
        }
        Insert: {
          chat_id: number
          cleared_at?: string | null
          created_at?: string | null
          id?: number
          is_archived?: boolean | null
          is_muted?: boolean | null
          is_pinned?: boolean | null
          muted_till?: string | null
          to_hide?: boolean | null
          user_id: string
        }
        Update: {
          chat_id?: number
          cleared_at?: string | null
          created_at?: string | null
          id?: number
          is_archived?: boolean | null
          is_muted?: boolean | null
          is_pinned?: boolean | null
          muted_till?: string | null
          to_hide?: boolean | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "users_chats_chat_id_fkey"
            columns: ["chat_id"]
            isOneToOne: false
            referencedRelation: "chats"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "users_chats_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      users_vibes: {
        Row: {
          id: number
          inserted_at: string
          is_favorite: boolean | null
          updated_at: string
          user_id: string
          vibe_id: number
        }
        Insert: {
          id?: number
          inserted_at?: string
          is_favorite?: boolean | null
          updated_at?: string
          user_id: string
          vibe_id: number
        }
        Update: {
          id?: number
          inserted_at?: string
          is_favorite?: boolean | null
          updated_at?: string
          user_id?: string
          vibe_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "users_vibes_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "users_vibes_vibe_id_fkey"
            columns: ["vibe_id"]
            isOneToOne: false
            referencedRelation: "vibes"
            referencedColumns: ["id"]
          },
        ]
      }
      vibe_pivot: {
        Row: {
          child_vibe_id: number
          parent_vibe_id: number
        }
        Insert: {
          child_vibe_id: number
          parent_vibe_id?: number
        }
        Update: {
          child_vibe_id?: number
          parent_vibe_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "public_vibe_pivot_child_vibe_id_fkey"
            columns: ["child_vibe_id"]
            isOneToOne: false
            referencedRelation: "vibes"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_vibe_pivot_parent_vibe_id_fkey"
            columns: ["parent_vibe_id"]
            isOneToOne: false
            referencedRelation: "vibes"
            referencedColumns: ["id"]
          },
        ]
      }
      vibes: {
        Row: {
          aliases: string | null
          embedding: string | null
          emoticon: string | null
          icon_url: string | null
          id: number
          inserted_at: string
          marker_url: string | null
          name: string
          search_vector: unknown | null
          updated_at: string
        }
        Insert: {
          aliases?: string | null
          embedding?: string | null
          emoticon?: string | null
          icon_url?: string | null
          id?: number
          inserted_at?: string
          marker_url?: string | null
          name: string
          search_vector?: unknown | null
          updated_at?: string
        }
        Update: {
          aliases?: string | null
          embedding?: string | null
          emoticon?: string | null
          icon_url?: string | null
          id?: number
          inserted_at?: string
          marker_url?: string | null
          name?: string
          search_vector?: unknown | null
          updated_at?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      check_invite_limit: {
        Args: {
          jamid: number
          userid: string
        }
        Returns: boolean
      }
      check_user_has_ivnite: {
        Args: {
          user_id: string
          current_user_id: string
        }
        Returns: {
          status: string
          profile: Json
          received_friend_request_id: number
          sent_friend_request_id: number
        }[]
      }
      clear_chat_messages: {
        Args: {
          chat_id: number
          for_everyone: boolean
          user_id: string
        }
        Returns: undefined
      }
      create_with_parent_id: {
        Args: {
          name: string
          aliases: string
          description: string
          parent: string
        }
        Returns: undefined
      }
      create_with_parent_ids: {
        Args: {
          name: string
          aliases: string
          description: string
          parents: string[]
        }
        Returns: undefined
      }
      delete_chats: {
        Args: {
          user_id: string
          chat_ids: number[]
          for_everyone: boolean
        }
        Returns: undefined
      }
      fetch_missing_data: {
        Args: {
          message_id: number
          replied_to: string
        }
        Returns: {
          message_text: string
          media_content: string
          usernam: string
        }[]
      }
      generate_description: {
        Args: Record<PropertyKey, never>
        Returns: undefined
      }
      generate_embedding: {
        Args: Record<PropertyKey, never>
        Returns: undefined
      }
      get_chat_pinned_messages: {
        Args: {
          chat_id: number
          user_id: string
          message_offset: number
        }
        Returns: {
          message: Json
        }[]
      }
      get_chat_with_user: {
        Args: {
          user_id: string
          current_user_id: string
        }
        Returns: number
      }
      get_jam_by_id: {
        Args: {
          jamid: number
          user_id: string
        }
        Returns: {
          id: number
          name: string
          description: string
          location_name: string
          lat: number
          lon: number
          date: string
          max_participants: number
          extra_information: string
          invites_only: boolean
          invites_per_member: number
          icon_url: string
          background_url: string
          creator_id: string
          related_vibes: Json
          participants: Json
          creator: Json
          join_requests: Json
        }[]
      }
      get_jams_locations: {
        Args: {
          userid: string
          userlocation: unknown
        }
        Returns: {
          jam_id: number
          name: string
          location_name: string
          description: string
          date: string
          vibes: Json
          latitude: number
          longitude: number
          creator_id: string
          creator_fcm_token: string
        }[]
      }
      get_my_jams: {
        Args: {
          user_id: string
        }
        Returns: {
          id: number
          name: string
          description: string
          location_name: string
          lat: number
          lon: number
          date: string
          max_participants: number
          extra_information: string
          invites_only: boolean
          invites_per_member: number
          icon_url: string
          background_url: string
          creator_id: string
          related_vibes: Json
          participants: Json
        }[]
      }
      get_one_root_chat: {
        Args: {
          user_id: string
          chat_id: number
        }
        Returns: {
          id: number
          related_contact: Json
          is_pinned: boolean
          is_archived: boolean
          to_hide: boolean
          last_message: Json
          unread_messages_count: number
        }[]
      }
      get_participated_jams: {
        Args: {
          user_id: string
        }
        Returns: {
          id: number
          name: string
          description: string
          location_name: string
          lat: number
          lon: number
          date: string
          max_participants: number
          extra_information: string
          invites_only: boolean
          invites_per_member: number
          icon_url: string
          background_url: string
          creator_id: string
          related_vibes: Json
          participants: Json
        }[]
      }
      get_participated_jams_outdated: {
        Args: {
          user_id: string
        }
        Returns: {
          id: number
          name: string
          description: string
          location_name: string
          lat: number
          lon: number
          date: string
          max_participants: number
          extra_information: string
          invites_only: boolean
          invites_per_member: number
          icon_url: string
          background_url: string
          creator_id: string
          related_vibes: Json
          participants: Json
        }[]
      }
      get_root_personal_chat_messages: {
        Args: {
          chat_id: number
          user_id: string
          message_offset: number
        }
        Returns: {
          message: Json
        }[]
      }
      get_root_personal_chats_with_meta: {
        Args: {
          user_id: string
        }
        Returns: {
          id: number
          related_contact: Json
          is_pinned: boolean
          is_archived: boolean
          to_hide: boolean
          cleared_at: string
          last_message: Json
          unread_messages_count: number
        }[]
      }
      get_sent_invites_with_profile: {
        Args: {
          user_id: string
        }
        Returns: {
          id: number
          jam_id: number
          invited_user_id: string
          sended_from_user_id: string
          status: unknown
          inserted_at: string
          sender: Json
          jam_name: string
        }[]
      }
      get_user_chats: {
        Args: {
          user_id: string
        }
        Returns: {
          chat_id: number
          friend_id: string
          friend_name: string
          last_message_sent_at: string
          last_message_text: string
          unread_messages_count: number
        }[]
      }
      get_user_friends: {
        Args: {
          user_id: string
        }
        Returns: {
          id: string
          username: string
          full_name: string
          avatar: string
          profile_status: string
          last_sign_in_at: string
          last_active_at: string
          public_key: string
          fcm_token: string
          root_chat_id: number
          to_hide: boolean
        }[]
      }
      get_user_full: {
        Args: {
          user_id: string
        }
        Returns: {
          data: Json
        }[]
      }
      get_user_privacy_settings: {
        Args: {
          user_id: string
        }
        Returns: {
          id: string
          can_be_found_by_phone: unknown
          display_last_seen_visibility: unknown
          can_be_invited_to_communities: unknown
          can_be_invited_to_jams: unknown
          map_visibility: unknown
          about_me_visibility: unknown
          phone_visibility: unknown
          visible_on_map_to_user_list: Json
        }[]
      }
      get_users: {
        Args: {
          user_ids: string[]
        }
        Returns: {
          data: Json
        }[]
      }
      get_users_and_jams: {
        Args: {
          userid: string
          userlocation: unknown
        }
        Returns: Json[]
      }
      get_users_with_same_vibes_locations: {
        Args: {
          userid: string
          userlocation: unknown
        }
        Returns: {
          user_id: string
          name: string
          vibes: Json
          latitude: number
          longitude: number
          is_friend: boolean
        }[]
      }
      hnswhandler: {
        Args: {
          "": unknown
        }
        Returns: unknown
      }
      is_chat_member_by_message_id: {
        Args: {
          message_id: number
          user_id: string
        }
        Returns: boolean
      }
      ivfflathandler: {
        Args: {
          "": unknown
        }
        Returns: unknown
      }
      jam_creator: {
        Args: {
          jamid: number
        }
        Returns: string[]
      }
      jam_member: {
        Args: {
          jamid: number
          isadmin: boolean
        }
        Returns: string[]
      }
      match_vibes: {
        Args: {
          query_embedding: string
          match_threshold: number
          match_count: number
        }
        Returns: {
          id: number
          name: string
          icon_url: string
          similarity: number
        }[]
      }
      post_jam: {
        Args: {
          name: string
          description: string
          location_name: string
          location: unknown
          date: string
          max_participants: number
          invites_per_member: number
          extra_information: string
          form_model: Json
          join_type: Database["public"]["Enums"]["jam_join_type"]
          icon_url: string
          related_vibes: number[]
          background_url: string
        }
        Returns: number
      }
      post_vibes: {
        Args: {
          vibe_ids: number[]
        }
        Returns: undefined
      }
      private_jam: {
        Args: {
          jamid: number
        }
        Returns: number[]
      }
      send_default_text_message: {
        Args: {
          chat_id: number
          message_text: string
          replied_to: number
        }
        Returns: number
      }
      update_embedding: {
        Args: {
          vector_data: string
          record_id: number
        }
        Returns: undefined
      }
      update_jam: {
        Args: {
          id: number
          name: string
          description: string
          location_name: string
          location: unknown
          date: string
          max_participants: number
          invites_per_member: number
          extra_information: string
          join_type: Database["public"]["Enums"]["jam_join_type"]
          icon_url: string
          related_vibes: number[]
          background_url: string
        }
        Returns: undefined
      }
      update_message: {
        Args: {
          message_id: number
          message_text: string
        }
        Returns: undefined
      }
      update_user_vibes: {
        Args: {
          userid: string
          vibeids: number[]
        }
        Returns: undefined
      }
      vector_avg: {
        Args: {
          "": number[]
        }
        Returns: string
      }
      vector_dims: {
        Args: {
          "": string
        }
        Returns: number
      }
      vector_norm: {
        Args: {
          "": string
        }
        Returns: number
      }
      vector_out: {
        Args: {
          "": string
        }
        Returns: unknown
      }
      vector_send: {
        Args: {
          "": string
        }
        Returns: string
      }
      vector_typmod_in: {
        Args: {
          "": unknown[]
        }
        Returns: number
      }
    }
    Enums: {
      jam_join_type:
        | "freeToJoin"
        | "invitesOnly"
        | "freeToJoinAfterForm"
        | "freetoJoinAfterFormAndApprove"
        | "requestToJoin"
      jam_qr_mode_enum:
        | "none"
        | "creator_checks_in"
        | "participants_check_in_themself"
      message_status_enum: "unread" | "read"
      msg_type_enum:
        | "text"
        | "audio_message"
        | "location"
        | "sticker"
        | "gif"
        | "video_message"
        | "audio"
        | "video"
        | "file"
        | "image"
        | "contact"
        | "event"
      pinned_message_state: "no_one" | "everyone" | "sender"
      privacy_boundaries_enum: "everyone" | "friendsOnly" | "noOne"
      process_step_type_enum:
        | "pending"
        | "declined"
        | "accepted"
        | "freezed"
        | "hidden"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never
