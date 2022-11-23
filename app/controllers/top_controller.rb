class TopController < ApplicationController
    
    def login 
        user = User.find_by(uname: params[:uname],email: params[:email])
         if user 
              logpass = BCrypt::Password.new(user.pass)
              if logpass == params[:pass]

                    session[:login_uname] = params[:uname]

                    redirect_to root_path
              else 
                    render 'login'

              end
         else 
            render 'login'
         end
    end
    
    def logout
        session.delete(:login_uname)
        session.delete(:login_pass)

        redirect_to root_path
    end
end
