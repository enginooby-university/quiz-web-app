package com.cpulover.questionnaire;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String showQuestionnaire(Model model) {
		model.addAttribute("answer", new Answer());
		return "questionnaire";
	}

	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public String showResult(@Valid @ModelAttribute Answer answer, BindingResult bindingResult,
			@RequestParam("file") MultipartFile file, ModelMap modelMap, HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "questionnaire";
		}
		String path = session.getServletContext().getRealPath("/") + file.getOriginalFilename();
		System.out.println(answer);
		System.out.println("Score: " + answer.checkResult());
		answer.userAnswerToString();
		modelMap.addAttribute("path", path);
		modelMap.addAttribute("file", file);

		// save uploaded file
		try {
			byte barr[] = file.getBytes();
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path));
			bout.write(barr);
			bout.flush();
			bout.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return "result";
	}
}
