load 'alfred_feedback.rb'
load 'parser.rb'
load 'autocomplete.rb'

villager, arg2 = ARGV

if villager
  @data = Parser.parse(villager)
  ac = Autocomplete.new (['Gender', 'Personality', 'Species', 'Birthday', 'Sign', 'Phrase', 'Clothes',
                           'Skill', 'Goal', 'Coffee', 'Style', 'Song', 'Appearances', 'Names'])
  ac.case_sensitive = false
  feedback = Feedback.new

  if arg2
    ac.autocomplete(arg2).each do |suggestion|
      case suggestion.capitalize

      when 'Gender'
        feedback.add_item(
          title:        'Gender',
          subtitle:     "#{@data['Gender']}",
          uid:          'gender',
          arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
          autocomplete: villager + ' gender',
          icon:         {
            type:       'filetype',
            name:       './icons/gender.png'
          }
        )

      when 'Personality'
        feedback.add_item(
          title:        'Personality',
          subtitle:     "#{@data['Personality']}",
          uid:          'personality',
          arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Personality']}",
          autocomplete: villager + ' personality',
          icon:         {
            type:       'filetype',
            name:       './icons/personality.png'
          }
        )

      when 'Species'
        feedback.add_item(
          title:        'Species',
          subtitle:     "#{@data['Species']}",
          uid:          'species',
          arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Species']}",
          autocomplete: villager + ' species',
          icon:         {
            type:       'filetype',
            name:       './icons/species.png'
          }
        )

      when 'Birthday'
        feedback.add_item(
          title:        'Birthday',
          subtitle:     "#{@data['Birthday']}",
          uid:          'birthday',
          arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Birthday'].split.at(0)}",
          autocomplete: villager + ' birthday',
          icon:         {
            type:       'filetype',
            name:       './icons/birthday.png'
          }
        )

      when 'Sign'
        feedback.add_item(
          title:        'Star sign',
          subtitle:     "#{@data['Star sign']}",
          uid:          'star',
          arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Star sign']}",
          autocomplete: villager + ' sign',
          icon:         {
            type:       'filetype',
            name:       './icons/star.png'
          }
        )

      when 'Phrase'
        feedback.add_item(
          title:        'Initial phrase',
          subtitle:     "#{@data['Initial phrase'].capitalize}",
          uid:          'phrase',
          arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
          autocomplete: villager + ' phrase',
          icon:         {
            type:       'filetype',
            name:       './icons/phrase.png'
          }
        )

      when 'Clothes'
        feedback.add_item(
          title:        'Initial clothes',
          subtitle:     "#{@data['Initial clothes']}",
          uid:          'clothes',
          arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
          autocomplete: villager + ' clothes',
          icon:         {
            type:       'filetype',
            name:       './icons/clothes.png'
          }
        )

      when 'Skill'
        unless @data['Skill'].nil?
          feedback.add_item(
            title:        'Skill',
            subtitle:     "#{@data['Skill']}",
            uid:          'skill',
            arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
            autocomplete: villager + ' skill',
            icon:         {
              type:       'filetype',
              name:       './icons/skill.png'
            }
          )
        end

      when 'Goal'
        unless @data['Goal'].nil?
          feedback.add_item(
            title:        'Goal',
            subtitle:     "#{@data['Goal']}",
            uid:          'goal',
            arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
            autocomplete: villager + ' goal',
            icon:         {
              type:       'filetype',
              name:       './icons/goal.png'
            }
          )
        end

      when 'Coffee'
        unless @data['Coffee'].nil?
          feedback.add_item(
            title:        'Coffee',
            subtitle:     "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
                          "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                          "#{@data['Coffee'].downcase.split(',').at(2) + '.'}",
            uid:          'coffee',
            arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
            autocomplete: villager + ' coffee',
            icon:         {
              type:       'filetype',
              name:       './icons/coffee.png'
            }
          )
        end

      when 'Style'
        unless @data['Style'].nil?
          feedback.add_item(
            title:        'Style',
            subtitle:     "#{@data['Style']}",
            uid:          'style',
            arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{@data['Style']}",
            autocomplete: villager + ' style',
            icon:         {
              type:       'filetype',
              name:       './icons/style.png'
            }
          )
        end

      when 'Song'
        unless @data['Favorite song'].nil?
          feedback.add_item(
            title:        'Favorite song',
            subtitle:     "#{@data['Favorite song']}",
            uid:          'song',
            arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Favorite song']}",
            autocomplete: villager + ' song',
            icon:         {
              type:       'filetype',
              name:       './icons/song.png'
            }
          )
        end

      when 'Appearances'
        feedback.add_item(
          title:        'Appearances',
          subtitle:     "#{@data['Appearances'].join(', ')}",
          uid:          'appearances',
          arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
          autocomplete: villager + ' appearances',
          icon:         {
            type:       'filetype',
            name:       './icons/appearances.png'
          }
        )

      when 'Names'
        subtitle_content = []
        @data['Regional names'].each do |key, val|
          subtitle_content.push(key + ': ' + val)
        end

        feedback.add_item(
          title:        'Regional names',
          subtitle:     subtitle_content.join(', '),
          uid:          'region',
          arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
          autocomplete: villager + ' names',
          icon:         {
            type:       'filetype',
            name:       './icons/region.png'
          }
        )
      end
    end
  puts feedback.to_xml

  else
    feedback.add_item(
      title:        'Gender',
      subtitle:     "#{@data['Gender']}",
      uid:          'gender',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: villager + ' gender',
      icon:         {
        type:       'filetype',
        name:       './icons/gender.png'
      }
    )

    feedback.add_item(
      title:        'Personality',
      subtitle:     "#{@data['Personality']}",
      uid:          'personality',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Personality']}",
      autocomplete: villager + ' personality',
      icon:         {
        type:       'filetype',
        name:       './icons/personality.png'
      }
    )

    feedback.add_item(
      title:        'Species',
      subtitle:     "#{@data['Species']}",
      uid:          'species',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Species']}",
      autocomplete: villager + ' species',
      icon:         {
        type:       'filetype',
        name:       './icons/species.png'
      }
    )

    unless @data['Birthday'] == 'Unknown'
      feedback.add_item(
        title:        'Birthday',
        subtitle:     "#{@data['Birthday']}",
        uid:          'birthday',
        arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Birthday'].split.at(0)}",
        autocomplete: villager + ' birthday',
        icon:         {
          type:       'filetype',
          name:       './icons/birthday.png'
        }
      )
    end

    unless @data['Star sign'] == 'Unknown'
      feedback.add_item(
        title:        'Star sign',
        subtitle:     "#{@data['Star sign']}",
        uid:          'star',
        arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Star sign']}",
        autocomplete: villager + ' sign',
        icon:         {
          type:       'filetype',
          name:       './icons/star.png'
        }
      )
    end

    feedback.add_item(
      title:        'Initial phrase',
      subtitle:     "#{@data['Initial phrase'].capitalize}",
      uid:          'phrase',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: villager + ' phrase',
      icon:         {
        type:       'filetype',
        name:       './icons/phrase.png'
      }
    )

    feedback.add_item(
      title:        'Initial clothes',
      subtitle:     "#{@data['Initial clothes']}",
      uid:          'clothes',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: villager + ' clothes',
      icon:         {
        type:       'filetype',
        name:       './icons/clothes.png'
      }
    )

    unless @data['Skill'].nil?
      feedback.add_item(
        title:        'Skill',
        subtitle:     "#{@data['Skill']}",
        uid:          'skill',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        autocomplete: villager + ' skill',
        icon:         {
          type:       'filetype',
          name:       './icons/skill.png'
        }
      )
    end

    unless @data['Goal'].nil?
      feedback.add_item(
        title:        'Goal',
        subtitle:     "#{@data['Goal']}",
        uid:          'goal',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        autocomplete: villager + ' goal',
        icon:         {
          type:       'filetype',
          name:       './icons/goal.png'
        }
      )
    end

    unless @data['Coffee'].nil?
      feedback.add_item(
        title:        'Coffee',
        subtitle:     "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
                      "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                      "#{@data['Coffee'].downcase.split(',').at(2) + '.'}",
        uid:          'coffee',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        autocomplete: villager + ' coffee',
        icon:         {
          type:       'filetype',
          name:       './icons/coffee.png'
        }
      )
    end

    unless @data['Style'].nil?
      feedback.add_item(
        title:        'Style',
        subtitle:     "#{@data['Style']}",
        uid:          'style',
        arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{@data['Style']}",
        autocomplete: villager + ' style',
        icon:         {
          type:       'filetype',
          name:       './icons/style.png'
        }
      )
    end

    unless @data['Favorite song'].nil?
      feedback.add_item(
        title:        'Favorite song',
        subtitle:     "#{@data['Favorite song']}",
        uid:          'song',
        arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Favorite song']}",
        autocomplete: villager + ' song',
        icon:         {
          type:       'filetype',
          name:       './icons/song.png'
        }
      )
    end

    feedback.add_item(
      title:        'Appearances',
      subtitle:     "#{@data['Appearances'].join(', ')}",
      uid:          'appearances',
      arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
      autocomplete: villager + ' appearances',
      icon:         {
        type:       'filetype',
        name:       './icons/appearances.png'
      }
    )

    unless @data['Regional names'].nil?
      subtitle_content = []
      @data['Regional names'].each do |key, val|
        subtitle_content.push(key + ': ' + val)
      end

      feedback.add_item(
        title:        'Regional names',
        subtitle:     subtitle_content.join(', '),
        uid:          'region',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        autocomplete: villager + ' names',
        icon:         {
          type:       'filetype',
          name:       './icons/region.png'
        }
      )
    end

    puts feedback.to_xml
  end
end
