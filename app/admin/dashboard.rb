ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do 
        column do 
            panel "Total Pastes" do 
                h1 number_with_delimiter(Paste.count)
            end
        end

        column do 
            panel "New in the last hour" do 
                h1 number_with_delimiter(Paste.where("created_at >= ?", 1.hour.ago).count)
            end
        end

        column do 
            panel "New in the last 24 hours" do 
                h1 number_with_delimiter(Paste.where("created_at >= ?", 24.hour.ago).count)
            end
        end 
    end

    columns do
        column do 
            panel "Words Indexed" do 
               h1 number_with_delimiter(Word.count) 
            end
        end
        column do 

        end
        column do 

        end
    end

    # columns do 
    #     column do 
    #         panel "Most Popular Words in the last 24 hours" do 
    #             require 'word_analysis' 

    #             word_rank = {}
    #             Paste.where("created_at >= ?", 24.hour.ago).each do |paste|
    #                 word_rank = WordAnalysis.word_rank(WordAnalysis.split_words(paste.contents), word_rank) 
    #             end
    #             ul do 
    #                 word_rank.sort_by{|k, v| v}.reverse.each do |word, count| 
    #                     li "#{word}, #{count}"
    #                 end
    #             end

    #         end
    #     end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
