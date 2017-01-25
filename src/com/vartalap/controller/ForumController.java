package com.vartalap.controller;

import java.util.*;

import javax.servlet.http.HttpSession;
import javax.ws.rs.QueryParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.portlet.ModelAndView;

import com.vartalap.model.Answer;
import com.vartalap.model.Question;
import com.vartalap.model.Tags;
import com.vartalap.model.User;
import com.vartalap.service.VartalapService;



@SessionAttributes("userName")
@Controller
public class ForumController {
	@Autowired
	VartalapService service;
	
	@RequestMapping(value={"/","/home"},method=RequestMethod.GET)
	public String showHomePage(Model model,HttpSession session){
		 List<Question> questions = null;
		 String userName=(String) session.getAttribute("userName");
		 if(userName==null) {
			 System.out.println("In null:"+userName);
			 questions = service.getQuestions();
			 for (Question question : questions) {
				 question.setNoOfAnswers(service.getAnswers(question.getQuestion_id()).size());
				 User user=service.getUserDetails(question.getQuestion_id());
				 question.setUser(user);
			}
			 List<Tags> tagList = service.getAllTags();
			 
			 model.addAttribute("list",questions);
			 model.addAttribute("tagList",tagList);
		 }else{
			 System.out.println("UserName:"+userName);
			 User user = service.getUserProfile(userName);
			 System.out.println("Skills:"+user.getSkills());
			 questions = service.getQuestionsByType(user.getSkills());
			 for (Question question : questions) {
				 question.setNoOfAnswers(service.getAnswers(question.getQuestion_id()).size());
				 User user2=service.getUserDetails(question.getQuestion_id());
				 question.setUser(user2);
			}
			 List<Tags> tagList = service.getTags(user.getSkills());
			// question.setNoOfAnswers(service.getAnswers(questions.getQuestion_id()).size());
			 System.out.println("Not null");
			 
			 model.addAttribute("list",questions);
			 model.addAttribute("tagList",tagList);
		 }
		
		
		 
		return "home";
	}
	@RequestMapping(value={"/logout"},method=RequestMethod.GET)
	public String showLogoutPage(){
		return "/logout";
	}
	
	@RequestMapping(value={"/aboutus"},method=RequestMethod.GET)
	public String aboutusPage(){
		return "aboutus/about";
	}
	
	@RequestMapping(value={"/unanswered"},method=RequestMethod.GET)
	public String unansweredQuestions(){
		return "question/unanswered";
	}
	@RequestMapping(value={"/typechart"},method=RequestMethod.GET)
	public String typeChart(Model model){
		int count[] = service.getCountByType();
		model.addAttribute("count", count);
		return "charts/typechart";
	}
	
	@RequestMapping(value={"/questionans"},method=RequestMethod.GET)
	public String questionAns(Model model){
		int count[][] = service.getAnsCountByType();
		model.addAttribute("count", count);
		return "charts/questionans";
	}
	
	@RequestMapping(value={"/profile"},method=RequestMethod.GET)
	public String showProfile(Model model,@QueryParam("userName") String userName){
		System.out.println(userName);
		User user = service.getUserProfile(userName);
		System.out.println(user);
		model.addAttribute("user", user);
		//No of questions posted by this user
		List<Question> list = service.getUserQuestions(user.getUser_id());
		for (Question question : list) {
			System.out.println(question);
		}
		System.out.println("Question Asked by "+user.getFirstName()+" : "+list.size());
		//List<Answer> answers=service.getUserAnswers(user.getUser_id());
		System.out.println("Total Answered Question :"+service.getUserAnswers(user.getUser_id()).size());
		model.addAttribute("countquestion", list.size());
		model.addAttribute("countanswer", service.getUserAnswers(user.getUser_id()).size());
		model.addAttribute("questionsasked", list);
		//No of answers posted by this user
		return "registration/profile";
	}
	
	@RequestMapping(value={"/viewanswer","home/viewanswer/{question_id}"},method=RequestMethod.GET)
	public String viewAnswer(Model model,@QueryParam("question_id") int question_id,HttpSession session){
		 List<Question> questions = service.getQuestions();
		 System.out.println("In view answer:"+question_id);
		 model.addAttribute("list",questions);
		 Question q=null;
		 for (Question question : questions) {
			if(question.getQuestion_id()==question_id){
				q=question;
				break;
			}
		}
		int count = service.incrementViewCount(question_id);
		System.out.println(q);
		List<Answer> answerList = service.getAnswers(question_id);
		for (Answer answer : answerList) {
			int id=answer.getUser_id();
			answer.setUser(service.getUserById(id));
		}
		model.addAttribute("answerList", answerList);
		//System.out.println("Id:"+service.getUserDetails(q.getQuestion_id()));
		 model.addAttribute("question", q);
		 String userName=(String) session.getAttribute("userName");
		 model.addAttribute("user", service.getUserProfile(userName));
		return "question/postanswer";
	}
	
	@RequestMapping(value={"/question"},method=RequestMethod.GET)
	public String showQuestionPage(){
		return "question/question";
	}
	
	@RequestMapping(value={"/search"},method=RequestMethod.GET)
	public String search(){
		System.out.println("In search");
		return "question/search";
	}
	
	@RequestMapping(value={"/questionbytags"},method=RequestMethod.GET)
	public String searchQuestions(@RequestParam("tagName") String tagName,Model model,HttpSession session){
		List<Question> quest=service.getQuestionsByTags(tagName);
		for(Question question : quest) {
			question.setUser(service.getUserDetails(question.getQuestion_id()));
			question.setNoOfAnswers(service.getAnswers(question.getQuestion_id()).size());
		}
		model.addAttribute("list", quest);
		System.out.println("In search Questions by tags");
		
		String userName=(String) session.getAttribute("userName");
		 if(userName==null) {
			
			
			 model.addAttribute("tagList",service.getAllTags());
		 }else{
			 User user=service.getUserProfile(userName);
			// List<Tags> tagList = service.getTags(user.getSkills());
			 model.addAttribute("tagList",service.getTags(user.getSkills()));
		 }
		
		return "home";
	}
	
	/*@RequestMapping(value={"/searchquestions"},method=RequestMethod.GET)
	public String searchQuestions(){
		System.out.println("In searchQuestions");
		return "question/search";
	}*/
	
	@RequestMapping(value={"/questiontype"},method=RequestMethod.GET)
	public String showQuestionType(){
		System.out.println("in questionType");
		return "question/questiontype";
	}
	@RequestMapping(value={"/remote"},method=RequestMethod.POST)
	public String remote() {
		return "registration/remote";
	}
	
	@RequestMapping(value={"/table"},method=RequestMethod.GET)
	public String table(Model model,@QueryParam("type") String type) {
		List<Question> quest=service.getQuestionsByType(type);
		for(Question question : quest) {
			question.setUser(service.getUserDetails(question.getQuestion_id()));
			question.setNoOfAnswers(service.getAnswers(question.getQuestion_id()).size());
		}
		model.addAttribute("questionList", quest);
		
		System.out.println("In table ");
		return "question/table";
	}
	
	@RequestMapping(value={"/unanswertable"},method=RequestMethod.GET)
	public String unanswertable(Model model,@QueryParam("type") String type) {
		List<Question> quest=service.getUnansCountByType(type);
		for(Question question : quest)
			System.out.println(question);
		model.addAttribute("unanswerquestion", quest);
		//System.out.println("In table ");
		return "question/unanswertable";
	}
	
	@RequestMapping(value={"viewanswer/home"},method=RequestMethod.GET)
	public String remote2() {
		return "home";
	}
	
	@RequestMapping(value={"/postquestion"},method=RequestMethod.POST)
	public String postQuestion(@RequestParam("search-box2") String searchbox2,@RequestParam("description") String description,@RequestParam("userName") String userName,@RequestParam("type") String type,@RequestParam("title")String tags,Model model) {
		System.out.println("in Post question tags:"+tags);
		System.out.println("title:::"+searchbox2);
		if(searchbox2.isEmpty()) {
			System.out.println("Question not posted");
			model.addAttribute("error", "Title cannot be empty");
			return "question/question";
		}else {
			Question questions=new Question();
			System.out.println("Id:"+service.getUserId(userName));
			String[] allTags = tags.split(",");
			Set<Tags> set = new HashSet<Tags>();
			for (String tag : allTags) {
				Tags t = new Tags(	);
				t.setTag_name(tag);
				set.add(t);
			}
			questions.setTitle(searchbox2);
			questions.setDescription(description);
			questions.setType(type);
			questions.setDate(new Date());
			questions.setTagList(set);
			service.postQuestion(questions,service.getUserId(userName));
			model.addAttribute("success", "Question posted Successfully");
			return "question/question";
		}
		
		
	}
	
	@RequestMapping(value={"/saveanswer"},method=RequestMethod.POST)
	public String postAnswer(@RequestParam("answer") String answer,@RequestParam("question") int question_id,@RequestParam("user") int user_id,Model model) {
		Answer ans = new Answer();
		System.out.println("In post Answer:");
		ans.setAnswer(answer);
		ans.setDate(new Date());
		System.out.println("answer:"+answer);
		System.out.println(question_id);
		if(answer != null && !answer.isEmpty() && !answer.equalsIgnoreCase(" ")) {
			service.postAnswer(ans, question_id, user_id);
		}
		
			
		//System.out.println("Id:"+service.getUserId(userName));
		System.out.println("In save answer");
		//service.postQuestion(questions,service.getUserId(userName));;
		//viewAnswer(question_id);
		return "redirect:viewanswer?question_id="+question_id;
	}
	
	/*@RequestMapping(value={"/loginServlet"},method=RequestMethod.POST)
	public void remote3() {
		loginServlet l=new loginServlet();
		
	}*/
	@RequestMapping(value={"rateanswer"},method=RequestMethod.GET)
	public void rateAnswer(@QueryParam("rating") int rating,@QueryParam("answer_id") int answer_id) {
		//return "home";
		System.out.println("In rate answer:"+rating);
		service.rateAnswer(rating, answer_id);
	}
}
