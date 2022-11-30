class TopController < ApplicationController
    
    def login 
        user = User.find_by(uname: params[:uname],email: params[:email])
         if user 
              logpass = BCrypt::Password.new(user.pass)
              if logpass == params[:pass]

                    session[:login] = params[:uname]
                    session[:login_uid] = user.id
                    
                    redirect_to root_path 
              else  
                    
                    redirect_to top_login_path
              end
         else 
            render 'login'
         end
    end
    
    def logout
        session.delete(:login)
        session.delete(:login_pass)

        redirect_to root_path
    end
end
