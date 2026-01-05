
package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.GetMapping;
import com.framework.annotation.PostMapping;
import com.framework.util.ModelView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Sprint 8: Demonstrates automatic injection of request parameters into a Map argument.
 */
@Controller
public class Sprint8Controller {

    @GetMapping("/sprint8/form")
    public ModelView showForm() {
        return new ModelView("/WEB-INF/views/sprint8/form.jsp");
    }

    @PostMapping("/sprint8/submit")
    public ModelView handleForm(Map<String, Object> formValues) {
        ModelView modelView = new ModelView("/WEB-INF/views/sprint8/result.jsp");

        List<String> selectedInterests = toStringList(formValues.get("interests"));
        boolean acceptTerms = isChecked(formValues.get("acceptTerms"));

        modelView.addObject("formValues", formValues)
                 .addObject("selectedInterests", selectedInterests)
                 .addObject("acceptTerms", acceptTerms);
        return modelView;
    }

    private boolean isChecked(Object value) {
        if (value == null) {
            return false;
        }
        if (value instanceof Boolean bool) {
            return bool;
        }
        return Boolean.parseBoolean(String.valueOf(value));
    }

    private List<String> toStringList(Object value) {
        if (value == null) {
            return List.of();
        }
        if (value instanceof String str) {
            if (str.isEmpty()) {
                return List.of();
            }
            return List.of(str);
        }
        if (value instanceof String[] array) {
            return filterEmpty(Arrays.asList(array));
        }
        if (value instanceof Iterable<?> iterable) {
            List<String> collected = new ArrayList<>();
            for (Object element : iterable) {
                if (element == null) {
                    continue;
                }
                String text = element.toString();
                if (!text.isEmpty()) {
                    collected.add(text);
                }
            }
            return collected;
        }
        String text = value.toString();
        if (text.isEmpty()) {
            return List.of();
        }
        return List.of(text);
    }

    private List<String> filterEmpty(List<String> source) {
        List<String> filtered = new ArrayList<>();
        for (String entry : source) {
            if (entry == null || entry.isEmpty()) {
                continue;
            }
            filtered.add(entry);
        }
        return filtered;
    }
}
