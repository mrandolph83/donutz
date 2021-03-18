class Donutz::Ascii

def self.top_header
  return "

         ▄████████████▄
     ▄███▀░░░░░░░░░░▀███▄
    ███░░░░░░░░░░░░░░░░███
   ██░░░░░░░░░░░░░░░░░░░░██
  ██░░░░░░░░░░░░░░░░░░░░░░██
 ██░░░░░░░░░░░░░░░░░░░░░░░░██
██░░░░░░░░▄████████▄░░░░░░░░██
██░░░░░░░███▀    ▀███░░░░░░░██
██░░░░░░░██        ██░░░░░░░██
██░░░░░░░███▄    ▄███░░░░░░░██
██░░░░░░░░▀████████▀░░░░░░░░██
 ██░░░░░░░░░░░░░░░░░░░░░░░░██
  ██░░░░░░░░░░░░░░░░░░░░░░██
   ██░░░░░░░░░░░░░░░░░░░░██
   ███░░░░░░░░░░░░░░░░███
    ▀███▄░░░░░░░░░░▄███▀
       ▀████████████▀".colorize(:light_magenta)
end

def self.bottom_footer
   return "
   
         d888888b                         d888888b
   d888    8888b                    d888888   888b
 d88    88  898888b               d8888  888     88b
d8P        88888888b             d88888888888     b8b
88        8888888888             88888888888       88
88       88888888888             8888888888        88
98b     88888888888P             988888888        d8P
 988     888  8888P      _=_      9888898  88    88P
   9888   888888P      q(-_-)p       98888    888P
      9888888P         '_) (_`         9888888P
         88            /__/  \            88
         88          _(<_   / )_          88
        d88b        (__\_\_|_/__)        d88b".colorize(:light_magenta)
end

end 