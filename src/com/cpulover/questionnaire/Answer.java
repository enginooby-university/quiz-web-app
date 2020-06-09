package com.cpulover.questionnaire;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Answer {
	@NotNull(message = "Required field")
	@Size(min = 1, message = "Required field")
	private String name;

	private String petName;

	// TODO: inject correct answers from properties file
	private List<String> correctAnswer;
	private List<String> userAnswer = new ArrayList<String>(5);

	public Answer() {
		correctAnswer = Arrays.asList("1c", "2b", "xml", "4b,4d");
	}

	public int checkResult() {
		int score = 0;
		// iteration and compare correctAnswer with userAnswer
		for (int i = 0; i < userAnswer.size(); i++) {
			if (userAnswer.get(i) != null && userAnswer.get(i).equalsIgnoreCase(correctAnswer.get(i))) {
				score++;
			}
		}
		correctAnswer.forEach(System.out::println);
		return score;
	}

	public void userAnswerToString() {
		userAnswer.forEach(System.out::println);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPetName() {
		return petName;
	}

	public List<String> getUserAnswer() {
		return userAnswer;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public void setUserAnswer(List<String> userAnswer) {
		this.userAnswer = userAnswer;
	}

	public List<String> getCorrectAnswer() {
		return correctAnswer;
	}

	@Override
	public String toString() {
		return "Answer [name=" + name + ", petName=" + petName + "]";
	}

}
