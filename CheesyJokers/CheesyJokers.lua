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
            slug = 'title_card',
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
            slug = 'frozen',
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
            slug = 'rainbow',
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
            slug = 'treasure_map',
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
            slug = 'extraterrestrial',
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
            slug = 'dithered',
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
            slug = 'businessman',
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
            slug = 'corrugated_iron',
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
            slug = 'piggy_bank',
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
            slug = 'vault',
            desc = {
                "At end of shop, set money",
                "to {C:money}$0{} and gain {C:chips}+#2#{} Chips",
                "for each dollar lost",
                "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
            },
            config = {
                extra = {
                    chips = 20,
                    chip_mod = 3
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
            slug = 'facial_recognition',
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
            slug = 'amoeba',
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
            slug = 'unfinished',
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
            cost = 5,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Coloured In",
            slug = 'coloured_in',
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
            slug = 'engraving',
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
            slug = 'surrealist_face',
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
    end

    set_ability_ref = Card.set_ability
    Card.set_ability = function(self, center, initial, delay_sprites)
        set_ability_ref(self, center, initial, delay_sprites)
        if center and center.name == 'Frozen Joker' and (center.discovered or self.bypass_discovery_center) then 
            self.T.h = self.T.h * 0.85
        end
    end
    

    SMODS.Jokers.j_title_card.calculate = function(self, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra}},
                Xmult_mod = self.ability.extra
            }
        end
    end

    SMODS.Jokers.j_frozen.calculate = function(self, context)
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

    SMODS.Jokers.j_rainbow.calculate = function(self, context)
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

    SMODS.Jokers.j_treasure_map.calculate = function(self, context)
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

    --[[ SMODS.Jokers.j_extraterrestrial.calculate = function(self, context)
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

    SMODS.Jokers.j_dithered.calculate = function(self, context)
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

    SMODS.Jokers.j_businessman.calculate = function(self, context)
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

    SMODS.Jokers.j_corrugated_iron.calculate = function(self, context)
        if context.selling_self and not context.blueprint then
            self.ability.extra = 0
        end
    end

    SMODS.Jokers.j_piggy_bank.calculate = function(self, context)
        if context.selling_card and not context.blueprint then
            self.ability.extra_value = self.ability.extra_value + context.card.sell_cost
            self:set_cost()
            card_eval_status_text(self, 'extra', nil, nil, nil, {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            })
        end
    end
    
    SMODS.Jokers.j_vault.calculate = function(self, context)
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

    SMODS.Jokers.j_amoeba.calculate = function(self, context)
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

    SMODS.Jokers.j_unfinished.calculate = function(self, context)
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

    SMODS.Jokers.j_coloured_in.calculate = function(self, context)
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
end


----------------------------------------------
------------MOD CODE END----------------------
