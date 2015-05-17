# Description:
#   Top 10 - Get the Nth item from the top 10.
#
# Notes:
#   
#   Scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.hear /top10 (.*)/i, (res) ->
    urls = ['https://www.owasp.org/index.php/Top_10_2013-A1-Injection',
            'https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management',
            'https://www.owasp.org/index.php/Top_10_2013-A3-Cross-Site_Scripting_(XSS)',
            'https://www.owasp.org/index.php/Top_10_2013-A4-Insecure_Direct_Object_References',
            'https://www.owasp.org/index.php/Top_10_2013-A5-Security_Misconfiguration',
            'https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure',
            'https://www.owasp.org/index.php/Top_10_2013-A7-Missing_Function_Level_Access_Control',
            'https://www.owasp.org/index.php/Top_10_2013-A8-Cross-Site_Request_Forgery_(CSRF)',
            'https://www.owasp.org/index.php/Top_10_2013-A9-Using_Components_with_Known_Vulnerabilities',
            'https://www.owasp.org/index.php/Top_10_2013-A10-Unvalidated_Redirects_and_Forwards'
            ]
    valid = [1,2,3,4,5,6,7,8,9,10]
    arg = res.match[1]
    if arg is "help"
      answer = "Usage:  owasp top10 x\n\twhere x is the item to look for.\n\tExample: owbot top10 1\n\tReturns the requested top10 item."
    else 
      num = parseInt(arg,10)
      intRegex = /^\d+$/;
      if num not in valid or not isFinite(arg) or not intRegex.test(arg) 
        answer = "Arg should be help or an integer 1-10."
      else 
        answer = urls[num-1]
     
    res.send answer