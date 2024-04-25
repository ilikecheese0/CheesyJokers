--- STEAMODDED HEADER
--- MOD_NAME: Cheesy Jokers
--- MOD_ID: CheesyJokers
--- MOD_AUTHOR: [ilikecheese]
--- MOD_DESCRIPTION: Might as well make my own joker pack since so may other people are doing it. 
--- BADGE_COLOUR: C9A926

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.CheesyJokers()
    local joker_sprites = SMODS.Sprite:new('new_jokers', SMODS.findModByID("CheesyJokers").path, "sprites.png", 71, 95, "asset_atli")
    joker_sprites:register()

    local jokers = {
        {
            name = "Title Card",
            slug = 'cj_title_card',
            desc = {
                "{X:red,C:white}X#1#{} Mult on {C:attention}first",
                "{C:attention}hand{} of round"
            },
            config = {
                extra = 2
            },
            pos = {x = 0, y = 0},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Frozen Joker",
            slug = 'cj_frozen',
            desc = {
                "This joker gains {C:chips}Chips{}",
                "equal to the level of your",
                "played {C:attention}poker hand{}",
                "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
            },
            config = {
                extra = {
                    chips = 10,
                    chip_mod = 1
                }
            },
            pos = {x = 1, y = 0},
            rarity = 1,
            cost = 5,
            loc_def = function(card) return {
                card.ability.extra.chips, 
                card.ability.extra.chip_mod} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Rainbow Joker",
            slug = 'cj_rainbow',
            desc = {
                "This Joker gains {X:mult,C:white} X0.25 {} Mult",
                "for each discarded {C:attention}Straight",
                "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
            },
            config = {
                x_mult = 1,
                extra = 0.25
            },
            pos = {x = 2, y = 0},
            rarity = 2,
            cost = 6,
            loc_def = function(card) return {
                card.ability.x_mult, 
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Treasure Map",
            slug = 'cj_treasure_map',
            desc = {
                "Earn {C:money}$#3#{} if played hand",
                "contains a scoring {C:attention}#1#{} and {C:attention}#2#{},",
                "ranks change every round"
            },
            config = {
                extra = 10
            },
            pos = {x = 3, y = 0},
            rarity = 1,
            cost = 6,
            loc_def = function(card) return {
                localize(G.GAME.current_round.treasure_card.rank1, 'ranks'), 
                localize(G.GAME.current_round.treasure_card.rank2, 'ranks'), 
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        --[[ {
            name = "Extraterrestrial",
            slug = 'cj_extraterrestrial',
            desc = {
                "When a {C:planet}Planet{} card is used,",
                "{C:green}#1# in #2#{} chance to add a copy",
                "to your consumable area",
                "{C:inactive}(Must have room)"
            },
            config = {
                extra = {odds = 3}
            },
            pos = {x = 4, y = 0},
            rarity = 2,
            cost = 5,
            loc_def = function(card) return {
                G.GAME.probabilities.normal, 
                card.ability.extra.odds} end,
            blueprint_compat = true,
            eternal_compat = true
        }, ]]
        {
            name = "Dithered Joker",
            slug = 'cj_dithered',
            desc = {
                "{C:chips}+123{} Chips if played",
                "hand contains exactly",
                "{C:attention}3{} different suits",
                "{C:inactive}(Do not need to score){}"
            },
            config = {
                extra = {chip_mod = 123}
            },
            pos = {x = 5, y = 0},
            rarity = 1,
            cost = 4,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Businessman",
            slug = 'cj_businessman',
            desc = {
                "Earn {C:money}$#1#{} when skipping {C:attention}Blind",
                "and increase this value by {C:money}$#2#"
            },
            config = {
                extra = {dollars = 4, increase = 4}
            },
            pos = {x = 6, y = 0},
            rarity = 1,
            cost = 3,
            loc_def = function(card) return {
                card.ability.extra.dollars, 
                card.ability.extra.increase} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Corrugated Iron",
            slug = 'cj_corrugated_iron',
            desc = {
                "Earn {C:money}$#1#{} if this",
                "Joker is destroyed"
            },
            config = {
                extra = 50
            },
            pos = {x = 7, y = 0},
            rarity = 2,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = false,
            eternal_compat = false
        }, 
        {
            name = "Piggy Bank",
            slug = 'cj_piggy_bank',
            desc = {
                "Gains sell value of",
                "all {C:attention}Jokers{} and",
                "{C:attention}Consumables{} sold"
            },
            config = {},
            pos = {x = 0, y = 1},
            rarity = 2,
            cost = 6,
            blueprint_compat = false,
            eternal_compat = true
        },
        {
            name = "Vault",
            slug = 'cj_vault',
            desc = {
                "At end of shop, set money",
                "to {C:money}$0{} and gain {C:chips}+#2#{} Chips",
                "for each dollar lost",
                "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
            },
            config = {
                extra = {
                    chips = 20,
                    chip_mod = 5
                }
            },
            pos = {x = 1, y = 1},
            rarity = 3,
            cost = 7,
            loc_def = function(card) return {
                card.ability.extra.chips, 
                card.ability.extra.chip_mod} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Facial Recognition",
            slug = 'cj_facial_recognition',
            desc = {
                "All {C:attention}face{} cards count as",
                "{C:attention}Kings, Queens{} and {C:attention}Jacks{}"
            },
            config = {},
            pos = {x = 2, y = 1},
            rarity = 2,
            cost = 4,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Amoeba",
            slug = 'cj_amoeba',
            desc = {
                "{X:red,C:white}X2{} Mult,",
                "duplicate this {C:attention}Joker",
                "when {C:attention}Blind{} is selected",
                "{C:inactive}(Must have room)"
            },
            config = {
                extra = 2
            },
            pos = {x = 3, y = 1},
            rarity = 3,
            cost = 9,
            blueprint_compat = false,
            eternal_compat = false
        }, 
        {
            name = "Unfinished Joker",
            slug = 'cj_unfinished',
            desc = {
                "{C:mult}+#1#{} Mult for each",
                "played card that",
                "{C:attention}does not score"
            },
            config = {
                extra = 7
            },
            pos = {x = 4, y = 1},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Coloured In",
            slug = 'cj_coloured_in',
            desc = {
                "Enhance a random card",
                "into a {C:attention}Wild{} card",
                "for each played hand"
            },
            config = {},
            pos = {x = 5, y = 1},
            rarity = 2,
            cost = 6,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Engraving",
            slug = 'cj_engraving',
            desc = {
                "{C:attention}Jokers{} no longer",
                "change their condition",
                "for activating"
            },
            config = {},
            pos = {x = 6, y = 1},
            rarity = 2,
            cost = 5,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Surrealist Face",
            slug = 'cj_surrealist_face',
            desc = {
                "{C:attention}Face{} cards count",
                "as any {C:attention}suit"
            },
            config = {},
            pos = {x = 7, y = 1},
            rarity = 2,
            cost = 5,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Sticker Sheet",
            slug = 'cj_sticker_sheet',
            desc = {
                "When {C:attention}Blind{} is selected,",
                "create a random {C:spectral}Spectral",
                "card that adds a {C:attention}Seal",
                "{C:inactive}(Must have room)"
            },
            config = {},
            pos = {x = 0, y = 2},
            rarity = 3,
            cost = 8,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Hot Air Balloon",
            slug = 'cj_balloon',
            desc = {
                "When a card is {C:attention}discarded,",
                "{C:green}#1# in #2#{} chance to",
                "increase its {C:attention}rank"
            },
            config = {
                extra = {odds = 3}
            },
            pos = {x = 1, y = 2},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                G.GAME.probabilities.normal, 
                card.ability.extra.odds} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Bitflip",
            slug = 'cj_bitflip',
            desc = {
                "If played {C:attention}hand{} contains",
                "exactly two cards,",
                "swap their {C:attention}suits{} and {C:attention}ranks"
            },
            config = {},
            pos = {x = 2, y = 2},
            rarity = 1,
            cost = 6,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Missing Piece",
            slug = 'cj_missing_piece',
            desc = {
                "All shop Jokers",
                "are {C:green}Uncommon"
            },
            config = {},
            pos = {x = 3, y = 2},
            rarity = 3,
            cost = 9,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Vending Machine",
            slug = 'cj_vending_machine',
            desc = {
                "Earn {C:money}$#1#{} per {C:red}discard,",
                "Lose {C:money}$#2#{} per played {C:attention}hand"
            },
            config = {
                extra = {
                    dollars = 3,
                    dollars_lost = 4
                }
            },
            pos = {x = 4, y = 2},
            rarity = 1,
            cost = 3,
            loc_def = function(card) return {
                card.ability.extra.dollars, 
                card.ability.extra.dollars_lost} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "AI Joker",
            slug = 'cj_ai',
            desc = {
                "{s:0.8}Effect changes every round"
            },
            config = {},
            pos = {x = 5, y = 2},
            rarity = 1,
            cost = 4,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "High Score",
            slug = 'cj_high_score',
            desc = {
                "Earn {C:money}$#1#{} whenever you",
                "triple the {C:attention}required",
                "{C:attention}score{} for the {C:attention}Blind"
            },
            config = {
                extra = 7
            },
            pos = {x = 6, y = 2},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Coupon",
            slug = 'cj_coupon',
            desc = {
                "Whenever you lose",
                "{C:attention}money,{} lose {C:money}$#1#{} less"
            },
            config = {
                extra = 2
            },
            pos = {x = 7, y = 2},
            rarity = 2,
            cost = 6,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = false,
            eternal_compat = true
        }, 
    }

    for _, v in pairs(jokers) do
        joker = SMODS.Joker:new(
            v.name, 
            v.slug, 
            v.config,
            v.pos,
            {name = v.name, text = v.desc},
            v.rarity,
            v.cost, 
            nil, 
            nil, 
            v.blueprint_compat, 
            v.eternal_compat, 
            nil, 
            'new_jokers',
            nil
        )
        joker.loc_def = v.loc_def
        joker:register()
    end

    set_sprites_ref = Card.set_sprites
    Card.set_sprites = function(self, _center, _front)
        set_sprites_ref(self, _center, _front)
        if _center and _center.name == 'Frozen Joker' and (_center.discovered or self.bypass_discovery_center) then 
            self.children.center.scale.y = self.children.center.scale.y * 0.85
        end
        if _center and _center.name == 'The Universe' then 
            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS['j_cj_universe'], self.config.center.pos)
            
            self.children.center.atlas.px = 284
            self.children.center.states.hover = self.states.hover
            self.children.center.states.collide.can = false
            self.children.center:set_role({major = self, role_type = 'Glued', draw_major = self})
        end
    end
    set_ability_ref = Card.set_ability
    Card.set_ability = function(self, center, initial, delay_sprites)
        set_ability_ref(self, center, initial, delay_sprites)
        if center and center.name == 'Frozen Joker' and (center.discovered or self.bypass_discovery_center) then 
            self.T.h = self.T.h * 0.85
        end
        if center and center.name == 'The Universe' then 
            self.T.w = self.T.w * 4
        end
    end

    card_load_ref = Card.load
    Card.load = function(self, cardTable, other_card)
        card_load_ref(self, cardTable, other_card)

        if self.config.center.name == "Frozen Joker" then 
            self.T.h = G.CARD_H * 0.85
        end
        if center and center.name == 'The Universe' then 
            self.T.w = G.CARD_W * 4
        end
    end



    SMODS.Jokers.j_cj_title_card.calculate = function(self, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra}},
                Xmult_mod = self.ability.extra
            }
        end
    end

    SMODS.Jokers.j_cj_frozen.calculate = function(self, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            if G.GAME.hands[context.scoring_name].level > 0 then
                self.ability.extra.chips = self.ability.extra.chips + (self.ability.extra.chip_mod * G.GAME.hands[context.scoring_name].level)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    card = self
                }
            end
        elseif context.joker_main then
            return {
                message = localize{type = 'variable', key = 'a_chips', vars = {self.ability.extra.chips}},
                chip_mod = self.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end

    SMODS.Jokers.j_cj_rainbow.calculate = function(self, context)
        if context.pre_discard and not context.blueprint then
            handname = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            if handname == 'Straight' then
                self.ability.x_mult = self.ability.x_mult + self.ability.extra
                card_eval_status_text(self, 'extra', nil, nil, nil, {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.x_mult}},
                        colour = G.C.RED,
                    card = self
                }) 
                return true
            end
        elseif context.joker_main then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.x_mult}},
                Xmult_mod = self.ability.x_mult
            }
        end
    end

    SMODS.Jokers.j_cj_treasure_map.calculate = function(self, context)
        if context.before and context.cardarea == G.jokers then
            local count_rank1 = 0
            local count_rank2 = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == G.GAME.current_round.treasure_card.id1 then 
                    count_rank1 = count_rank1 + 1 
                elseif next(find_joker("Facial Recognition")) and 
                context.scoring_hand[i]:is_face() and (
                (G.GAME.current_round.treasure_card.id1 == 11) or 
                (G.GAME.current_round.treasure_card.id1 == 12) or 
                (G.GAME.current_round.treasure_card.id1 == 13)) then
                    count_rank1 = count_rank1 + 1 
                end

                if context.scoring_hand[i]:get_id() == G.GAME.current_round.treasure_card.id2 then 
                    count_rank2 = count_rank2 + 1 
                elseif next(find_joker("Facial Recognition")) and 
                context.scoring_hand[i]:is_face() and (
                (G.GAME.current_round.treasure_card.id2 == 11) or 
                (G.GAME.current_round.treasure_card.id2 == 12) or 
                (G.GAME.current_round.treasure_card.id2 == 13)) then
                    count_rank2 = count_rank2 + 1 
                end
            end

            local give_money = false
            if G.GAME.current_round.treasure_card.id1 == G.GAME.current_round.treasure_card.id2 then
                give_money = (count_rank1 >= 2)
            else
                give_money = (count_rank1 >= 1 and count_rank2 >= 1)
            end
                
            if give_money then
                ease_dollars(self.ability.extra)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.ability.extra
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    message = localize('$')..self.ability.extra,
                    dollars = self.ability.extra,
                    colour = G.C.MONEY
                }
            end
        end
    end

    --[[ SMODS.Jokers.j_cj_extraterrestrial.calculate = function(self, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if pseudorandom('extraterrestrial') < G.GAME.probabilities.normal/self.ability.extra.odds then
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local card = copy_card(context.consumeable)
                            card:add_to_deck()
                            G.consumeables:emplace(card) 
                            return true
                        end}))
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_copied_ex')})
                end
            end
        end
    end ]]

    SMODS.Jokers.j_cj_dithered.calculate = function(self, context)
        if context.joker_main then
            local suits = {
                ['Hearts'] = 0,
                ['Diamonds'] = 0,
                ['Spades'] = 0,
                ['Clubs'] = 0
            }
            for i = 1, #context.full_hand do
                if context.full_hand[i].ability.name ~= 'Wild Card' then
                    if context.full_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = 1
                    elseif context.full_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = 1
                    elseif context.full_hand[i]:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = 1
                    elseif context.full_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = 1 end
                end
            end
            for i = 1, #context.full_hand do
                if context.full_hand[i].ability.name == 'Wild Card' then
                    if context.full_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.full_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = 1
                    elseif context.full_hand[i]:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = 1
                    elseif context.full_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = 1 end
                end
            end
            if suits["Hearts"] + suits["Diamonds"] + suits["Spades"] + suits["Clubs"] == 3 then
                return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.extra.chip_mod}},
                    chip_mod = self.ability.extra.chip_mod,
                }
            end
        end
    end

    SMODS.Jokers.j_cj_businessman.calculate = function(self, context)
        if context.skip_blind then
            reward = self.ability.extra.dollars
            if not context.blueprint then
                self.ability.extra.dollars = reward + self.ability.extra.increase
            end
            card_eval_status_text((context.blueprint_card or self), 'extra', nil, nil, nil, {
                message = localize('$')..reward,
                dollars = reward,
                colour = G.C.MONEY
            })
            ease_dollars(reward)
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + reward
            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
        end
    end

    SMODS.Jokers.j_cj_corrugated_iron.calculate = function(self, context)
        if context.selling_self and not context.blueprint then
            self.ability.extra = 0
        end
    end

    SMODS.Jokers.j_cj_piggy_bank.calculate = function(self, context)
        if context.selling_card and not context.blueprint then
            self.ability.extra_value = self.ability.extra_value + context.card.sell_cost
            self:set_cost()
            card_eval_status_text(self, 'extra', nil, nil, nil, {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            })
        end
    end
    
    SMODS.Jokers.j_cj_vault.calculate = function(self, context)
        if context.ending_shop and not context.blueprint then
            local money = math.max(0, G.GAME.dollars)
            if G.GAME.dollars ~= 0 then
                ease_dollars(-G.GAME.dollars, true)
            end
            if money ~= 0 then
                self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_mod * money
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    card = self
                }
            end
        elseif context.joker_main then
            return {
                message = localize{type = 'variable', key = 'a_chips', vars = {self.ability.extra.chips}},
                chip_mod = self.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end

    SMODS.Jokers.j_cj_amoeba.calculate = function(self, context)
        if context.setting_blind and not self.getting_sliced and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = copy_card(self, nil, nil, nil, self.edition and self.edition.negative)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
                end}))
            card_eval_status_text(self, 'extra', nil, nil, nil, {message = "Mitosis!"}) 
        elseif context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra}},
                Xmult_mod = self.ability.extra
            }
        end
    end

    SMODS.Jokers.j_cj_unfinished.calculate = function(self, context)
        if context.joker_main then
            local m = self.ability.extra * (#context.full_hand - #context.scoring_hand)
            if m > 0 then
                return {
                    message = localize{type = 'variable', key = 'a_mult', vars = {m}},
                    mult_mod = m
                }
            end
        end
    end

    SMODS.Jokers.j_cj_coloured_in.calculate = function(self, context)
        if context.before and context.cardarea == G.jokers then
            local options = {}
            for k, v in ipairs(context.full_hand) do
                if v.ability.name ~= 'Wild Card' then 
                    options[#options + 1] = v
                end
            end
            if #options > 0 then
                local card = pseudorandom_element(options, pseudoseed('coloured'))
                card:set_ability(G.P_CENTERS.m_wild, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true
                    end
                }))
                delay(1)
            end
        end
    end

    SMODS.Jokers.j_cj_sticker_sheet.calculate = function(self, context)
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local options = {
                                'c_deja_vu',
                                'c_talisman',
                                'c_medium',
                                'c_trance'
                            }
                            local to_create = pseudorandom_element(options, pseudoseed('sticker'))
                            local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, to_create)
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end}))   
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})                       
                    return true
                end)}))
            end
        end
    end

    SMODS.Jokers.j_cj_balloon.calculate = function(self, context)
        if context.discard then
            if pseudorandom('balloon') < G.GAME.probabilities.normal / self.ability.extra.odds then
                local card = context.other_card
                local suit = string.sub(card.base.suit, 1, 1)
                local rank = card.base.id == 14 and 2 or math.min(card.base.id + 1, 14)
                if rank < 10 then rank = tostring(rank)
                elseif rank == 10 then rank = 'T'
                elseif rank == 11 then rank = 'J'
                elseif rank == 12 then rank = 'Q'
                elseif rank == 13 then rank = 'K'
                elseif rank == 14 then rank = 'A'
                end
                card:set_base(G.P_CARDS[suit .. '_' .. rank])
                card:juice_up(0.3, 0.3)
                return {
                    message = "Rank Up!",
                    card = self
                }
            end
        end
    end

    SMODS.Jokers.j_cj_bitflip.calculate = function(self, context)
        if context.before and context.cardarea == G.jokers and #context.full_hand == 2 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card1 = context.full_hand[1]
                    local card2 = context.full_hand[2]
                    card2_copy = {}
                    for k, v in pairs(card2.config.card) do 
                        card2_copy[k] = v
                    end
                    card2:set_base(card1.config.card)
                    card1:set_base(card2_copy)
                    card1:juice_up(0.3, 0.3)
                    card2:juice_up(0.3, 0.3)
                    return true
                end
            })) 
            return {
                message = localize('k_swapped_ex')
            }
        end
    end

    SMODS.Jokers.j_cj_vending_machine.calculate = function(self, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(self.ability.extra.dollars)
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('$')..self.ability.extra.dollars,colour = G.C.MONEY, delay = 0.45})
                    return true
                end}))
            return
        elseif context.before and context.cardarea == G.jokers then
            ease_dollars(-self.ability.extra.dollars_lost)
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - self.ability.extra.dollars_lost
            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            return {
                message = localize('$') .. -self.ability.extra.dollars_lost,
                dollars = -self.ability.extra.dollars_lost,
                colour = G.C.RED
            }
        end
    end

    SMODS.Jokers.j_cj_ai.calculate = function(self, context)
        local conditions = {
            [1] = function(self, context)
                if context.setting_blind and not self.getting_sliced then
                    return 1
                else return 0 end
            end,
            [2] = function(self, context)
                if context.skipping_booster then
                    return 1
                else return 0 end
            end,
            [3] = function(self, context)
                if context.playing_card_added and context.cards and context.cards[1] then
                    return #context.cards
                else return 0 end
            end,
            [4] = function(self, context)
                if context.before and context.cardarea == G.jokers then
                    if context.scoring_name == G.GAME.current_round.ai_ability.condition_vars[1] then return 1 end
                end
                return 0
            end,
            [5] = function(self, context)
                if context.pre_discard then
                    if G.FUNCS.get_poker_hand_info(G.hand.highlighted) == G.GAME.current_round.ai_ability.condition_vars[1] then return 1 end
                end
                return 0
            end,
            [6] = function(self, context)
                if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
                    return 1 
                else return 0 end
            end,
            [7] = function(self, context)
                if context.selling_card and context.card and context.card.sell_cost >= 3 then
                    return 1 
                else return 0 end
            end,
        }
        local reps = conditions[G.GAME.current_round.ai_ability.condition](self, context)
        if reps > 0 and not context.blueprint and not self.getting_sliced then
            effect = G.GAME.current_round.ai_ability.effect
            if effect == 1 then
                reward = reps * 3 * G.GAME.round_resets.blind_ante
                card_eval_status_text((context.blueprint_card or self), 'extra', nil, nil, nil, {
                    message = localize('$') .. reward,
                    dollars = reward,
                    colour = G.C.MONEY
                })
                ease_dollars(reward)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + reward
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            elseif effect == 2 then
                for i = 1, reps do
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'ai_tarot')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                return true
                            end)}))
                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                end
            elseif effect == 3 then
                local poker_hands = {}
                for k, v in pairs(G.GAME.hands) do
                    if v.visible then poker_hands[#poker_hands + 1] = k end
                end
                for i = 1, reps * 2 do
                    local hand = pseudorandom_element(poker_hands, pseudoseed('ai_level_hand' .. i))
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname = localize(hand, 'poker_hands'), chips = G.GAME.hands[hand].chips, mult = G.GAME.hands[hand].mult, level = G.GAME.hands[hand].level})
                    level_up_hand(context.blueprint_card or self, hand, nil, 1)
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
                end
            elseif effect == 4 then
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    local jokers_to_create = math.min(reps, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                    for i = 1, jokers_to_create do
                        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'ai_joker')
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_joker')})
                    end
                    G.GAME.joker_buffer = 0
                end
                reward = reps * 3 * G.GAME.round_resets.blind_ante
                card_eval_status_text((context.blueprint_card or self), 'extra', nil, nil, nil, {
                    message = localize('$') .. reward,
                    dollars = reward,
                    colour = G.C.MONEY
                })
                ease_dollars(reward)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + reward
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            elseif effect == 5 then
                for i = 1, reps do
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                    local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'ai_spectral')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                return true
                            end)}))
                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                end
            else
                text = "+" .. (reps * 15) .. " Max HP"
                card_eval_status_text(self, 'extra', nil, nil, nil, {message = text, colour = G.C.RED})
            end
        end
    end


    calculate_joker_ref = Card.calculate_joker
    Card.calculate_joker = function(self, context)
        if next(find_joker("Facial Recognition")) then
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                if self.ability.name == 'Shoot the Moon' and context.other_card:is_face() then
                    if context.other_card.debuff then
                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED,
                            card = self,
                        }
                    else
                        return {
                            h_mult = 13,
                            card = self
                        }
                    end
                end
                if self.ability.name == 'Baron' and context.other_card:is_face() then
                    if context.other_card.debuff then
                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED,
                            card = self,
                        }
                    else
                        return {
                            x_mult = self.ability.extra,
                            card = self
                        }
                    end
                end
            elseif context.individual and context.cardarea == G.play and not context.end_of_round then
                if self.ability.name == 'The Idol' and context.other_card:is_suit(G.GAME.current_round.idol_card.suit) then
                    if context.other_card:is_face() and (
                    (G.GAME.current_round.idol_card.id == 11) or 
                    (G.GAME.current_round.idol_card.id == 12) or 
                    (G.GAME.current_round.idol_card.id == 13)) then
                        return {
                            x_mult = self.ability.extra,
                            colour = G.C.RED,
                            card = self
                        }
                    end
                end
                if self.ability.name == 'Triboulet' and context.other_card:is_face() then
                    return {
                        x_mult = self.ability.extra,
                        colour = G.C.RED,
                        card = self
                    }
                end
            elseif context.discard then
                if self.ability.name == 'Mail-In Rebate' and not context.other_card.debuff then
                    if context.other_card:is_face() and (
                    (G.GAME.current_round.mail_card.id == 11) or 
                    (G.GAME.current_round.mail_card.id == 12) or 
                    (G.GAME.current_round.mail_card.id == 13)) then
                        ease_dollars(self.ability.extra)
                        return {
                            message = localize('$')..self.ability.extra,
                            colour = G.C.MONEY,
                            card = self
                        }
                    end
                end
                if self.ability.name == 'Hit the Road' and not context.other_card.debuff and context.other_card:is_face() and not context.blueprint then
                    self.ability.x_mult = self.ability.x_mult + self.ability.extra
                    return {
                        message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                            colour = G.C.RED,
                            delay = 0.45, 
                        card = self
                    }
                end
            end
        end
        return calculate_joker_ref(self, context)
    end

    init_game_object_ref = Game.init_game_object
    Game.init_game_object = function()
        rv = init_game_object_ref()
        rv.current_round.treasure_card = {rank1 = '2', rank2 = '3'}
        rv.current_round.ai_ability = {
            condition = 1, 
            effect = 1,
            condition_vars = {
                'Straight'
            },
            effect_vars = {

            }
        }
        return rv
    end

    reset_mail_rank_ref = reset_mail_rank
    function reset_mail_rank()
        if next(find_joker("Engraving")) then return end
        reset_mail_rank_ref()

        local valid_treasure_cards = {}
        for k, v in ipairs(G.playing_cards) do
            if v.ability.effect ~= 'Stone Card' then
                valid_treasure_cards[#valid_treasure_cards+1] = v
            end
        end

        if valid_treasure_cards[1] then 
            local card1 = pseudorandom_element(valid_treasure_cards, pseudoseed('treasure_map_1'..G.GAME.round_resets.ante))
            G.GAME.current_round.treasure_card.rank1 = card1.base.value
            G.GAME.current_round.treasure_card.id1 = card1.base.id

            local card2 = pseudorandom_element(valid_treasure_cards, pseudoseed('treasure_map_2'..G.GAME.round_resets.ante))
            G.GAME.current_round.treasure_card.rank2 = card2.base.value
            G.GAME.current_round.treasure_card.id2 = card2.base.id
        end

        G.GAME.current_round.ai_ability.condition = math.ceil(pseudorandom('ai_condition'..G.GAME.round_resets.ante) * 7)
        G.GAME.current_round.ai_ability.effect = math.ceil(pseudorandom('ai_effect'..G.GAME.round_resets.ante) * 5.1)

        G.GAME.current_round.ai_ability.condition_vars[1] = pseudorandom_element({'Flush', 'Straight', 'Full House'}, pseudoseed('ai_hand'..G.GAME.round_resets.ante))
    end

    reset_ancient_card_ref = reset_ancient_card
    function reset_ancient_card()
        if next(find_joker("Engraving")) then return end
        reset_ancient_card_ref()
    end

    reset_idol_card_ref = reset_idol_card
    function reset_idol_card()
        if next(find_joker("Engraving")) then return end
        reset_idol_card_ref()
    end

    reset_castle_card_ref = reset_castle_card
    function reset_castle_card()
        if next(find_joker("Engraving")) then return end
        reset_castle_card_ref()
    end

    is_suit_ref = Card.is_suit
    Card.is_suit = function(self, suit, bypass_debuff, flush_calc)
        if self:is_face() and next(find_joker("Surrealist Face")) then
            return true
        else
            return is_suit_ref(self, suit, bypass_debuff, flush_calc)
        end
    end

    start_dissolve_ref = Card.start_dissolve
    Card.start_dissolve = function(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
        if self.ability and self.ability.name == 'Corrugated Iron' and self.ability.extra > 0 then
            card_eval_status_text(self, 'extra', nil, nil, nil, {
                message = localize('$')..self.ability.extra,
                dollars = self.ability.extra,
                colour = G.C.MONEY
            })
            ease_dollars(self.ability.extra)
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.ability.extra
            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            delay(0.3)
        end
        start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
    end

    draw_card_ref = Card.draw
    Card.draw = function(self, layer)
        draw_card_ref(self, layer)
        if layer ~= 'shadow' and self.sprite_facing == 'front' and self.ability then
            if self.ability.name == 'Sticker Sheet' and (self.config.center.discovered or self.bypass_discovery_center) then
                self.children.center:draw_shader('voucher', nil, self.ARGS.send_to_shader)
            end
        end
    end

    get_current_pool_ref = get_current_pool
    get_current_pool = function(_type, _rarity, _legendary, _append)
        if _type == 'Joker' and _append == 'sho' and not _rarity and next(find_joker("Missing Piece")) then
            return get_current_pool_ref(_type, 0.8, _legendary, _append)
        else
            return get_current_pool_ref(_type, _rarity, _legendary, _append)
        end
    end

    G.localization.descriptions.AIConditions = {
        [1] = {text = {
            "When {C:attention}Blind{} is selected,"
        }},
        [2] = {text = {
            "If {C:attention}Booster Pack{} is skipped,"
        }},
        [3] = {text = {
            "When {C:attention}playing card{} is",
            "added to your deck,"
        }},
        [4] = {text = {
            "If played hand is a {C:attention}#1#,"
        }},
        [5] = {text = {
            "If a {C:attention}#1#{} is discarded,"
        }},
        [6] = {text = {
            "For each {C:planet}Planet{} card used,"
        }},
        [7] = {text = {
            "When a card is sold",
            "for {C:money}$3{} or more,"
        }},
    }

    G.localization.descriptions.AIEffects = {
        [1] = {text = {
            "earn {C:money}$3{} per {C:attention}Ante"
        }},
        [2] = {text = {
            "create a {C:tarot}Tarot{} card"
        }},
        [3] = {text = {
            "upgrade the level of",
            "2 random {C:attention}poker hands"
        }},
        [4] = {text = {
            "create a random {C:attention}Joker",
            "{C:inactive}(Must have room)"
        }},
        [5] = {text = {
            "create a {C:spectral}Spectral{} card"
        }},
        [6] = {text = {
            "gain {X:red,C:white} +15 {C:red} Max HP"
        }},
    }

    init_localization()

    generate_card_ui_ref = generate_card_ui
    generate_card_ui = function(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
        if _c.name == 'AI Joker' then
            full_UI_table = {
                main = {},
                info = {},
                type = {},
                name = nil,
                badges = badges or {}
            }

            local condition_vars = G.GAME.current_round.ai_ability.condition_vars
            local effect_vars = G.GAME.current_round.ai_ability.effect_vars
            localize {type = 'descriptions', set = 'AIConditions', key = G.GAME.current_round.ai_ability.condition, nodes = full_UI_table.main, vars = condition_vars}
            localize {type = 'descriptions', set = 'AIEffects', key = G.GAME.current_round.ai_ability.effect, nodes = full_UI_table.main, vars = effect_vars}
        end
        return generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    end

    calculate_dollar_bonus_ref = Card.calculate_dollar_bonus
    Card.calculate_dollar_bonus = function(self)
        if self.ability.name == 'High Score' and not self.debuff then
            if G.GAME.chips * 3 >= G.GAME.blind.chips then return self.ability.extra end
        end
        return calculate_dollar_bonus_ref(self)
    end

    ease_dollars_ref = ease_dollars
    ease_dollars = function(mod, instant)
        if next(find_joker('Coupon')) and mod < 0 then
            mod = math.min(0, mod + 2 * #find_joker('Coupon'))
            for k, v in pairs(find_joker('Coupon')) do 
                v:juice_up(0.3, 0.3)
                card_eval_status_text(v, 'extra', nil, nil, nil, {message = "Discount!", instant = true})
            end
        end
        ease_dollars_ref(mod, instant)
    end
    
    set_ranks_ref = CardArea.set_ranks
    CardArea.set_ranks = function(self)
        set_ranks_ref(self)
        for k, card in ipairs(self.cards) do
            if card.config.center.name == 'The Universe' then
                card.states.drag.can = false
            end
        end
    end
end


----------------------------------------------
------------MOD CODE END----------------------
